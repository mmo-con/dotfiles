# Load the passphrase-protected SSH key into the ssh-agent for this session.
# The key on disk stays encrypted; ssh-add prompts once for its passphrase
# (look it up in the kdbx if you don't remember it). Reuses a running agent.
# Key lifetime is set via $SSH_ADD_LIFETIME (default 8h).
function ssh_load() {
    local lifetime="${SSH_ADD_LIFETIME:-8h}"
    local keys=()
    local fp

    if [[ -n "$1" ]]; then
        keys=("$HOME/.ssh/$1")
    else
        for k in id_ed25519 id_rsa; do
            [[ -f "$HOME/.ssh/$k" ]] && keys+=("$HOME/.ssh/$k")
        done
    fi

    if (( ${#keys[@]} == 0 )); then
        echo "ssh_load: No SSH keys found." >&2
        return 1
    fi

    ssh-add -l >/dev/null 2>&1
    if [[ $? -eq 2 || -z "$SSH_AUTH_SOCK" ]]; then
        eval "$(ssh-agent -s)" >/dev/null
    fi

    local success=0
    for key in "${keys[@]}"; do
        [[ -r "$key" ]] || { echo "ssh_load: $key not readable" >&2; continue; }

        if [[ -r "$key.pub" ]]; then
            fp="$(ssh-keygen -lf "$key.pub" 2>/dev/null | awk '{print $2}')"
            if [[ -n "$fp" ]] && ssh-add -l 2>/dev/null | grep -q -- "$fp"; then
                success=1
                continue
            fi
        fi

        if ssh-add -t "$lifetime" "$key"; then
            success=1
        fi
    done

    return $(( success ? 0 : 1 ))
}

# Copy the public SSH key to the clipboard. If a key name is provided,
# it will look for that key in ~/.ssh. If no key name is provided, it
# will look for id_ed25519.pub or id_rsa.pub in that order.
function copyssh() {
    local key_path

    if [[ -n "$1" ]]; then
        if [[ "$1" == *.pub ]]; then
            key_path="$HOME/.ssh/$1"
        else
            key_path="$HOME/.ssh/$1.pub"
        fi
    else
        for k in id_ed25519.pub id_rsa.pub; do
            if [[ -f "$HOME/.ssh/$k" ]]; then
                key_path="$HOME/.ssh/$k"
                break
            fi
        done
    fi

    if [[ -n "$key_path" && -f "$key_path" ]]; then
        xclip -selection clipboard < "$key_path"
        return 0
    fi

    echo "Public key not found. (Tried: ${key_path:-no default keys exist})" >&2
    return 1
}

function gpgenc() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: gpgenc <file>" >&2
        return 1
    fi

    if [[ ! -f "$1" ]]; then
        echo "File not found: $1" >&2
        return 1
    fi

    if [[ -e "$1.gpg" ]]; then
        echo "Output already exists: $1.gpg" >&2
        return 1
    fi

    gpg --symmetric \
        --cipher-algo AES256 \
        --compress-algo none \
        --s2k-mode 3 \
        --s2k-digest-algo SHA512 \
        --s2k-count 65011712 "$1"
}

function gpgdec() {
    if [[ $# -ne 1 ]]; then
        echo "Usage: gpgdec <file.gpg>" >&2
        return 1
    fi

    if [[ "$1" != *.gpg ]]; then
        echo "Input file must have a .gpg extension." >&2
        return 1
    fi

    if [[ ! -f "$1" ]]; then
        echo "File not found: $1" >&2
        return 1
    fi

    local outfile="${1%.gpg}"

    if [[ -e "$outfile" ]]; then
        echo "Output already exists: $outfile" >&2
        return 1
    fi

    gpg --decrypt --output "$outfile" "$1"
}

# Backup (copy) of a file
function bak() {
    cp -av -- "$1" "$1.$(date +%Y%m%d-%H%M%S).bak"
}

# Backup (copy) of a file and open original in editor
function bakk() {
    cp -av -- "$1" "$1.$(date +%Y%m%d-%H%M%S).bak"
    $EDITOR "$1"
}

# Show top directory sizes
function usg() {
    local n=${1:-10}
    du -sh -- *(N/) | sort -hr | head -n "$n"
}

# Remove-Suffix
function rms() {
    if [[ -z "$1" ]]; then
        echo "Missing suffix." >&2
        return 1
    fi

    local suffix="$1"
    local file new

    setopt local_options null_glob

    for file in *; do
        [[ -f "$file" && "$file" == *"$suffix" ]] || continue
        new="${file%"$suffix"}"
        printf '%s -> %s\n' "$file" "$new"
        mv -n -- "$file" "$new"
    done
}

# Copy-Path-of-File
function cpf() {
    local file abs_path

    file=$(fd --type f --hidden --exclude .git | fzf --header "Copy absolute path of file" \
                             --preview '[[ -f {} ]] && (bat --color=always --style=numbers --line-range :100 {} 2>/dev/null || head -n 100 {} 2>/dev/null)')

    if [[ -n "$file" ]]; then
        abs_path="${file:A}"
        printf "%s" "$abs_path" | xclip -selection clipboard
        echo "Copied: $abs_path"
    fi
}

# Extract compressed files of various types
function ex() {
    if [ -z "$1" ]; then
        echo "Usage: ex <file1> [<file2> ...]"
        return 1
    fi

    for file in "$@"; do
        if [ -f "$file" ]; then
            case "$file" in
                *.tar.bz2)  tar xjf "$file"   ;;
                *.tar.gz)   tar xzf "$file"   ;;
                *.bz2)      bunzip2 "$file"   ;;
                *.rar)      unrar x "$file"   ;;
                *.gz)       gunzip "$file"    ;;
                *.tar)      tar xf "$file"    ;;
                *.tbz2)     tar xjf "$file"   ;;
                *.tgz)      tar xzf "$file"   ;;
                *.zip)      unzip "$file"     ;;
                *.Z)        uncompress "$file";;
                *.7z)       7z x "$file"      ;;
                *)          echo "'$file' cannot be extracted via ex()" ;;
            esac
        else
            echo "'$file' is not a valid file"
        fi
    done
}

# Make-Change-Directory
function mcd() {
	if [ $# -ne 1 ]; then
		echo "Usage: mcd <directory>" >&2
		return 1
	fi

	mkdir -p "$1" && cd "$1" || return 1
}

# Fzf-Change-Directory browser
function fcd() {
    local dir
    local search_root="${1:-.}"

    dir=$(fd . "$search_root" --type d --hidden --exclude .git | fzf --header "Change to directory" \
                            --preview 'eza --tree --level=2 --icons=always --color=always {} 2>/dev/null')

    [[ -n "$dir" ]] && cd "$dir"
}

# Fzf-Editor browser
function fe() {
    local file
    file=$(fzf --preview '
        if [[ -f {} ]]; then
            if command -v bat >/dev/null 2>&1; then
                bat --color=always --style=numbers --line-range :100 {}
            else
                head -n 100 {}
            fi
        fi
    ')
    [[ -n "$file" ]] && $EDITOR "$file"
}

# Fzf-Kill-Process browser
function fkp() {
    local pid=$(ps -ef | sed 1d | FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS" fzf -m --header='[kill:process]' | awk '{print $2}')

    if [ "x$pid" != "x" ]
        then
            echo "$pid" | xargs kill -${1:-9}
    fi
}

# Fzf-CheckOut helper
function fco() {
    local tags branches target branch_name
    branches=$(
        git --no-pager branch --all \
          --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    |   sed '/^$/d') || return
    tags=$(
        git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
    target=$(
        (echo "$branches"; echo "$tags") |
        fzf --no-hscroll --no-multi -n 2 \
        --ansi) || return
    branch_name=$(awk '{print $2}' <<<"$target" )
    branch_name=$(echo "$branch_name" | sed -e "s|origin/||g")
    git checkout "$branch_name"
}

# Fzf-Git-Log browser
function fgl() {
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" | \
    fzf --ansi --no-sort --reverse --tiebreak=index \
        --preview 'f() { set -- $(echo "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always "$1"; }; f {}' \
        --header "Press Enter to leave"
}

# Fzf-Git-Stash browser
function fgst() {
    local stash
    stash=$(git stash list | fzf --ansi --no-sort -d ':' --preview 'git stash show -p --color=always {1}')

    if [[ -n "$stash" ]]; then
        # Extrahiert die reine Stash-ID vor dem ersten Doppelpunkt
        local stash_id=$(echo "$stash" | cut -d':' -f1)
        git stash apply "$stash_id"
    fi
}

# Fzf-Systemd-Service browser
function fsys() {
    local service
    service=$(systemctl list-unit-files --type=service --no-legend | awk '{print $1}' | \
              fzf --header "Systemd Services" --preview 'systemctl status {}')

    if [[ -n "$service" ]]; then
        echo "Aktion für $service: [s]tatus, [U]p/Start, [D]own/Stop, [r]estart, [q]uit"
        read -k 1 ch
        echo
        case "$ch" in
            s) systemctl status "$service" ;;
            U) sudo systemctl start "$service" && systemctl status "$service" ;;
            D) sudo systemctl stop "$service" && systemctl status "$service" ;;
            r) sudo systemctl restart "$service" && systemctl status "$service" ;;
            *) return 0 ;;
        esac
    fi
}

# Update branches of a Git repository from the remote, with optional filtering by branch name pattern.
function git_update_branches() {
    emulate -L zsh
    setopt localoptions nounset pipefail

    local pattern="${1:-}"
    local remote="origin"
    local current_branch
    local branches
    local worktree_status
    local command_status
    local update_failed=0

    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Error: You are not inside a Git repository." >&2
        return 1
    fi
    if ! worktree_status=$(git status --porcelain=v1 --untracked-files=normal); then
        echo "Error: Could not determine the repository status." >&2
        return 1
    fi
    if [[ -n "$worktree_status" ]]; then
        echo "Error: You have uncommitted changes. Please commit or stash them before updating branches." >&2
        return 1
    fi

    echo "Fetching latest changes from remote '${remote}'..."
    git fetch --all --prune || return $?

    current_branch=$(git branch --show-current) || return $?

    if [[ -n "$pattern" ]]; then
        branches=$(git for-each-ref --format='%(refname:short)' refs/heads/ | grep -E "$pattern")
    else
        branches=$(git for-each-ref --format='%(refname:short)' refs/heads/) || return $?
    fi
    if [[ -z "$branches" ]]; then
        echo "No branches found matching pattern: '${pattern}'"
        return 0
    fi

    for branch in ${(f)branches}; do
        if [[ "$branch" == "$current_branch" ]]; then
            echo "Updating current active branch: $branch"
            git merge --ff-only "${remote}/${branch}"
            command_status=$?
            (( command_status == 130 )) && return 130
            if (( command_status != 0 )); then
                echo "Warning: Could not fast-forward $branch. You might have divergent changes." >&2
                update_failed=1
            fi
        else
            echo "Updating background branch: $branch"
            git fetch "$remote" "${branch}:${branch}"
            command_status=$?
            (( command_status == 130 )) && return 130
            if (( command_status != 0 )); then
                echo "Warning: Could not update $branch from $remote." >&2
                update_failed=1
            fi
        fi
    done

    return $update_failed
}
