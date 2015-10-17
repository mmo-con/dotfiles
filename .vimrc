"=====================================[ VIMRC ]======================================
"
"Author: Markus Moll (mmo)
"Mail:   markus.moll.contact@gmail.com
"Date:   Di 13. Okt 22:42:57 CEST 2015
"
"Requirements:
"      * vim must be compiled with +python +cscope +conceal
"      * installed cscope, ctags, clang and grep (the_silver_searcher)
"
"Plugins:
"      + Pathogen (https://github.com/tpope/vim-pathogen)
"          - Gather plugins in seperate directories under .vim/bundle
"      + Rainbow Parenthesis (https://github.com/luochen1990/rainbow)
"          - Emphasize nested brackets by colour
"      + Buffer Close (https://github.com/Gozala/.vim/blob/master/plugin/bclose.vim)
"          - Close buffers without destruction of current splitting
"      + cvim (http://www.vim.org/scripts/script.php?script_id=213)
"          - Comprehensive C/C++ support for vim
"      + bash-support (http://www.vim.org/scripts/script.php?script_id=365)
"          - Comprehensive Bash support for vim
"      + perl-support (http://vim.sourceforge.net/scripts/script.php?script_id=556)
"          - Comprehensive Perl support for vim
"      + CCtree (https://github.com/hari-rangarajan/CCTree/)
"          - Generate and display call-trees (depends on cscope database)
"      + vim-airline (https://github.com/bling/vim-airline)
"          - Customizable status-/tabline
"      + vim-easymotion (https://github.com/Lokaltog/vim-easymotion)
"          - jump anywhere by tag-highlighting
"      + taglist (http://vim.sourceforge.net/scripts/script.php?script_id=273)
"          - Navigate through sourcecode via a bar listing tags
"      + ctrlp (https://github.com/kien/ctrlp.vim)
"          - Open files via fuzzy search
"      - omniCppComplete (https://github.com/vim-scripts/OmniCppComplete)
"          - Codecompletion for C/C++
"      + clang complete (https://github.com/Rip-Rip/clang_complete)
"          - Clang-based code completion (much better for C++)
"      + autoComplPop (https://github.com/vim-scripts/AutoComplPop)
"          - Popup menu for autocompletion of code and normal text
"      + ultisnips (https://github.com/sirver/ultisnips)
"          - Snippet insertion engine
"      + vim-snippets (https://github.com/honza/vim-snippets)
"          - Default snippets that can be used by ultisnips
"      + grep (http://www.vim.org/scripts/script.php?script_id=311)
"          - grep integration into vim via quickfix window
"      + ag (https://github.com/rking/ag.vim)
"          - plugin for faster alternative to grep/ack (the_silver_searcher)
"      + toggle-whitespace (https://github.com/ntpeters/vim-better-whitespace)
"          - show trailing (and other) unwanted whitespaces and remove them
"      + multiple-cursors (https://github.com/terryma/vim-multiple-cursors)
"          - multiple cursors ...
"      + AsyncCommand (http://www.vim.org/scripts/script.php?script_id=3431)
"          - Shell commands (especially make) no longer lock vim
"      + vcscommand (http://www.vim.org/scripts/script.php?script_id=90)
"          - Version control from within vim
"      + Pyclewn (http://pyclewn.sourceforge.net/)
"          - gdb intergration into vim
"
"=================================[ GENERAL STUFF ]==================================

set nocp                     "No compatible mode with vi (must be set
                             "at the beginning)
let mapleader = ","          "Personal command prefix (must be changed
                             "before plugins are loaded)
call pathogen#infect()       "Use pathogen to organise plugins

filetype plugin on           "Load plugins depending on filetype
filetype indent on           "Indenting depending on filetype
syntax on                    "Activate syntax highlighting

scriptencoding utf-8         "Character encoding for this file

set grepprg=grep\ -nH\ $*    "Set grep app
set nowrap                   "Turn off wrapping lines
set list                     "Show invisible text structure marks
set listchars=extends:>,precedes:<  "Text structure marks
set ttyfast                  "Assume fast terminal connection
set lazyredraw               "Do not redraw screen on commands not being typed
set title                    "Show title in console title bar
set autoread                 "Auto-read if file is changed from outside
set history=1000             "Remember last 1000 input lines
set undolevels=1000          "Take up to 1000 actions back
set undofile                 "Turn on undos
set backup                   "Turn on backups
set noswapfile               "Turn off swapfiles
set mouse=a                  "Allow mouse usage in all modes
set fileencoding=utf-8       "File encoding (writing!)
set encoding=utf-8           "File encoding (reading!)
set showmatch                "Show matching brackets
set showcmd                  "Show command in last line
set ruler                    "Show cursor position in line
set expandtab                "Use spaces instead of tabs
set smarttab                 "Use tabs smarter :-)
set tabstop=4                "An indentation each 4 spaces
set softtabstop=4            "Let backspace delete indent
set shiftwidth=4             "Numbers of spaces to (auto)indent
set cindent                  "Use C indentation pattern
set incsearch                "Incremental search
set noignorecase             "Case-sensitivity when searching
set hlsearch                 "Highlight search string in text
set relativenumber           "Show relative line numbers
set number                   "Show line number of current line
set textwidth=85             "Linebreak after n characters
set nofoldenable             "Really, really no code folding
set scrolloff=15             "Number of lines to keep above/below
set mat=5                    "Tenth of seconds blinking when matching brackets
set laststatus=2             "last window will always have statusline
set nofoldenable             "Do not allow code folding at startup
set foldmethod=indent        "Fold based on indent
set foldnestmax=1            "Deepest fold is 1 level
set synmaxcol=350            "No syntax highlighting for more than 350 cols
set colorcolumn=+1           "Show vertical bar at textwidth
set cursorline               "Highlight current line
"set spell                    "Use spell correction
"set spelllang=en_gb          "Define language for spell

"Colorschemes
"wombat256mod molokai wombat256mod twilight darknight256
"jellybeans xoria256 256-sartoo badwolf gruv gruvbox
"mustang darkburn zenburn ir_black ir_dark

if(has("gui_running"))
    set guioptions-=T
    set guioptions+=m
    set listchars=tab:▸\
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
    "set guifont=Inconsolata\ 12
    "set guifont=Meslo\ LG\ S\ 10
    set background=dark     "Adapt colours for background
    colorscheme gruvbox
    set lines=999 columns=999
else
    set t_Co=256            "Configure for 256 colours terminal
    set background=dark     "Adapt colours for background
    colorscheme badwolf
endif

"Save when losing focus
augroup save_on_focus_lost
    au!
    au FocusLost * :silent! wall
augroup END

"Undo and backup folders
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//

"tagfile folders
set tags+=.vimfiles/stdclib
set tags+=.vimfiles/localclib

"Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

"===================================[ CODE STYLE ]===================================

set cinoptions=
set cinoptions+=>s  "Normal indent by shiftwidth
set cinoptions+=e0  "Modify indent +/-0 when /{$/
set cinoptions+=n0  "Modify indent +/-0 for braceless control block
set cinoptions+=f0  "First brace in column 0
set cinoptions+={1s "Modify opening brace indent by +/-1
set cinoptions+=}0  "Modify closing brace indent by +/-0
set cinoptions+=^0  "Modify indent inside braces by +/-0
set cinoptions+=:s  "Case labels are <sw> from switch()
set cinoptions+==0  "Modify case statement indent by +/-0
set cinoptions+=l1  "Align statements relative to case label
set cinoptions+=b0  "Align break with statements, not case label
set cinoptions+=g0  "Scope declarations align with braces
set cinoptions+=hs  "Statements after scope statements are indented <sw>
set cinoptions+=ps  "K&R parameters are indented <sw>
set cinoptions+=ts  "Return type declarations are indented <sw>
set cinoptions+=is  "Indent C++ base classes and cinits <sw>
set cinoptions+=+s  "Indent continuation lines <sw>
set cinoptions+=c3  "Indent comment lines +3 after comment opener.
set cinoptions+=C0  "Comments behave correctly
set cinoptions+=/0  "Indent comments <sw> extra
set cinoptions+=(0  "Indent continuation in unclosed parens 2<sw>
set cinoptions+=u0  "Same as above, one level deeper, add <sw>
set cinoptions+=U0  "Ignore (/u if parens is first non-ws char.
set cinoptions+=w1  "Line up with first unclosed paren.
set cinoptions+=W0  "Unclosed paren change.
set cinoptions+=m0  "Parens line up properly
set cinoptions+=M0  "Parens line up properly
set cinoptions+=j1  "Anonymous classes are indented correctly.
set cinoptions+=)20 "Unclosed parens up to 20 lines away
set cinoptions+=*30 "Unclosed comments up to 30 lines away

"===================================[ MAPPINGS ]=====================================

"Insert current time/date
nnoremap <Leader>D :r!date<cr>

"Sort lines
vnoremap <Leader>S :!sort<cr>

"Quickly leave insertmode
imap jk <Esc>

"Quickly save all buffers
nnoremap <Leader>w :wa<cr>

"Quickly exit
nnoremap <C-q> :wqa<cr>

"Navigation on jklö (for german qwertz keyboard layout!)
noremap ö l
noremap l k
noremap k j
noremap j h

"Adapt the customized navigation to window navigation, too
noremap <Space>ö <c-w>l
noremap <Space>l <c-w>k
noremap <Space>k <c-w>j
noremap <Space>j <c-w>h

"Use <left>, <right> to cycle through buffers
nnoremap <right> :bn<cr>
nnoremap <left> :bp<cr>

"Kill current buffer without destroying the buffer-structure
nnoremap <up> :Kwbd<cr>

nnoremap <C-c> :Kwbd<cr> ZZ<cr>

"Quickfix navigation
nnoremap <F5> :botright copen<CR>
nnoremap <F6> :cclose<CR>
nnoremap <F7> :cprevious<CR>
nnoremap <F8> :cnext<CR>

"File diffs
nnoremap <Leader>ds :vert diffsplit

"Remove search match highlighting
noremap <silent> <Leader><space> :noh<cr>:call clearmatches()<cr>

"Dont move on '*'
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>
                 \*:call winrestview(stay_star_view)<cr>

"Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap { {zz
nnoremap } }zz

"No german Sonderzeichen
inoremap ü ue
inoremap ö oe
inoremap ä ae
inoremap ß ss

"Jump to beginning/end of line
noremap H ^
noremap L $
vnoremap L g_

"Mark word
nnoremap mw bve

"Quick editing of frequently used files
nnoremap <Leader>eh :vsplit /server/home/mmo/misc/how_to_hafas<cr>
nnoremap <Leader>ek :vsplit /server/home/mmo/sys_config/kgoevv_test_server<cr>
nnoremap <Leader>em :vsplit ~/.mutt/muttrc<cr>
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

"Working with split screen nicely
"Resize Split when the window is resized"
augroup equal_when_resized
    au!
    au VimResized * :wincmd =
augroup END

"Surround word under cursor with '"'
nnoremap <Leader>" viw<esc>a"<esc>hbi"<esc>lel

"Clean trailing whitespace
"nnoremap <Leader>t mz:%s/\s\+$//<cr>:let @/=''<cr>`z

"Split lines (as counterpart to [J]oin lines)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

"Better indentation
vnoremap < <gvh
vnoremap > >gvh

"Let it break into pieces ...
nmap <Leader>mon :split<cr>:vsplit<cr><C-Down>:vsplit<cr><C-Up><Leader>l

"============================[ FUNCTIONS / MINI-PLUGINS ]============================

"Highlight Word
"--------------
"This mini-plugin provides a few mappings for highlighting words temporarily.
"Sometimes you're looking at a hairy piece of code and would like a certain
"word or two to stand out temporarily. You can search for it, but that only
"gives you one color of highlighting. Now you can use <leader>N where N is
"a number from 1-6 to highlight the current word in a specific color.
function! HiInterestingWord(n) " {{{
    "Save our location.
    normal! mz
    "Yank the current word into the z register.
    normal! "zyiw
    "Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    "Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    "Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    "Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    "Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

"Functions for the generation of cscope databases
"------------------------------------------------
function! CollectCscopeFileNames()
    "Collect all the files you want the tags to be generated for
    "and write them to the vimfiles directory. Files with weird
    "suffixes or without any suffix at all must be stated seperately.
    "There are two reasons for this detour: 1. we dont want to generate
    "tags for scripts and config files that are maybe located in the
    "project folder and 2. we dont want vim.grep to search the tagfiles
    "that are otherwise stored in the project folder.
    silent! !find %:p:h -maxdepth 1 -name '*.c' -o -name '*.h'
                  \ -o -name '*.cpp' -o -name '*.hpp' -o -name 'structh'
                  \ -o -name 'ainclude' -o -name 'ariglobs' -o -name 'mkglobs'
                  \ -o -name 'mixglob' -o -name 'prototyp' -o -name 'vardimh'
                  \ > .vimfiles/cscope.files
endfunction

function! ProcessCscopeDatabase()
    let l:new_created=0
    "The function firstly generates 'cscope.files' and then generates
    "the cscope database
    if !isdirectory(".vimfiles")
        call mkdir(".vimfiles")
        let l:new_created=1
    endif
    silent! call CollectCscopeFileNames()
    "The following is a workaround. The cscope database is created
    "incorrectly when cscope is called from the project folder. Changing into
    "the subdirectory '.vimfiles' solves the problem - not clear why.
    :cd .vimfiles
    silent! !cscope -i cscope.files -cbq -f cscope.out
    silent! :cs reset
    :cd ..
    "If you create the database for the first time you have to add it first.
    if l:new_created
        silent! :cs add .vimfiles/cscope.out
    endif
    echo "Processed cscope database."
endfunction

function! ProcessCallTree()
    "The function generates the database for the use of calltrees
    if !isdirectory(".vimfiles")
        call mkdir(".vimfiles")
    endif
    "Load Cscope Database and save it in native crossref format
    silent! CCTreeLoadDB .vimfiles/cscope.out
    silent! CCTreeSaveXRefDB .vimfiles/cctree.out
endfunction

"Generation of ctags databases
"-----------------------------
function! ProcessCtagsDatabase()
    if !isdirectory(".vimfiles")
        call mkdir(".vimfiles")
    endif
    "Generate stdlib database only once
    if empty(glob(".vimfiles/stdclib"))
        silent! !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+qf
                 \ --language-force=C++ --tag-relative=yes -f .vimfiles/stdclib
                 \ /usr/include/c++/
    endif
    "Generate Tag-file for local project files
    silent! !ctags -a -h="+." --language-force="c++" --sort=yes --c++-kinds=+p --fields=+iaS
                  \ --extra=+qf --tag-relative=yes -f .vimfiles/localclib *
    echo "Processed ctags database."
endfunction

"Toggle between absolute/relative line numbers
"---------------------------------------------
function! ToggleNumber()
  if(&relativenumber)
    set norelativenumber
    set number
  else
    set relativenumber
    set number
  endif
endfunc

"Toggle vertical bar for cursorposition
"--------------------------------------
let g:cursorcolumn=0

function! ToggleCursorColumn()
	if(g:cursorcolumn)
		set nocursorcolumn
		set completeopt=menuone,preview
		let g:cursorcolumn=0
	else
		set cursorcolumn
		set completeopt=menuone
		let g:cursorcolumn=1
	endif
endfunction

"============================[ PLUGIN CONFIGURATIONS ]===============================

"Grep config
let Grep_Default_Options = '-i'
nnoremap <silent> <Leader>g :Grep<CR>

"nnoremap <silent> <Leader>g :Ag<CR>
"let g:ag_format="%f:%l:%c:%m"

"Search word under cursor with Ack
"nnoremap <Leader>A :Ack -n <cword><cr>

"Ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want UltiSnips to split your window.
let g:UltiSnipsEditSplit="vertical"

"ConqueGdb config
let g:ConqueGdb_SrcSplit = 'above'
nnoremap <Leader>pp :exe "Cprint " . expand("<cword>") <CR>

"rainbow brackets config
"let g:rainbow_active = 1

"Ctrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Vim-airline config
if(has("gui_running"))
    let g:airline_theme='gruvbox'
else
    let g:airline_theme='badwolf'
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if(has("gui_running"))
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = 'B'
    let g:airline_symbols.readonly = 'R'
    let g:airline_symbols.linenr = 'L'

    let g:airline#extensions#tabline#enabled      = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#left_sep     = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
else
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = 'B'
    let g:airline_symbols.readonly = 'R'
    let g:airline_symbols.linenr = 'L'

    let g:airline#extensions#tabline#enabled      = 1
    let g:airline#extensions#tabline#show_buffers = 1
    let g:airline#extensions#tabline#left_sep     = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
endif

"OmniCppComplete config
au BufNewFile,BufRead,BufEnter *.c,*.h,*.cpp,*.hpp,*.sh
                  \ set omnifunc=omni#cpp#complete#Main
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_MayCompleteArrow    = 1
let OmniCpp_MayCompleteDot      = 1
let OmniCpp_NameSpaceSearch     = 1
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
au InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"AutoComplPop config
let g:acp_enableAtStartup    = 1
let g:acp_completeoptPreview = 1

"Use 'ctrl-space' to complete
inoremap <C-space> <C-x><C-o>

"NERDtree config
"if(has("gui_running"))
"    autocmd VimEnter * NERDTree
"endif
let NERDTreeWinSize    = 25
let NERDTreeMinimalUI  = 1
let NERDChristmasTree  = 1
let NERDTreeStatusline = 1
let NERDTreeChDirMode  = 2

"Taglist config
"if(has("gui_running"))
""    let Tlist_Auto_Open      = 1
"endif
let Tlist_WinWidth           = 30
let Tlist_Use_Right_Window   = 1
let Tlist_Compact_Format     = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Update        = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Show_One_File      = 1
let Tlist_Sort_Type          = "name"

set title titlestring=%<%f\ %([%{Tlist_Get_Tag_Prototype_By_Line()}]%)

"CCtree config
let g:CCTreeWindowVertical = 0
let g:CCTreeOrientation    = "below"
let g:CCTreeWindowHeight   = 25
let g:CCTreeKeyTraceForwardTree = '<F11>'
let g:CCTreeKeyTraceReverseTree = '<F12>'

"Cscope config
if has("cscope")
    set cst        "Search cscope and tag files
    set csto=0     "Search first cscope then tag files
    set nocsverb
    "Add any database in current directory
    if filereadable(".vimfiles/cscope.out")
        cs add .vimfiles/cscope.out
    "Else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    "Use quickfix window to show results
    set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
    set cscopepathcomp=3
    set csverb
    "set cscopeverbose "Inform when different DB is added
    " 's' symbol:   Find all references to the token under cursor
    " 'g' global:   Find global definition(s) of the token under cursor
    " 'c' calls:    Find all calls to the function name under cursor
    " 't' text:     Find all instances of the text under cursor
    " 'e' egrep:    Egrep search for the word under cursor
    " 'f' file:     Open the filename under cursor
    " 'i' includes: Find files that include the filename under cursor
    " 'd' called:   Find functions that function under cursor calls
    nnoremap <F1> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <F2> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <F3> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <F4> :cs find d <C-R>=expand("<cword>")<CR><CR>
    "Same mappings but open in split view
    nnoremap <Leader><F1> :scs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <Leader><F2> :scs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <Leader><F3> :scs find c <C-R>=expand("<cword>")<CR><CR>
    nnoremap <Leader><F4> :scs find d <C-R>=expand("<cword>")<CR><CR>
endif

"cvim configuration
let g:C_LineEndCommColDefault = 50

"Kick cvim <C-j> override out!
"let g:C_Ctrl_j = 'off'

"===========================[ PLUGIN SPECIFIC MAPPINGS ]=============================

"Update cscope Database and use it without restarting Vim
nnoremap <Leader><F5> :call ProcessCscopeDatabase()<CR>
nnoremap <Leader><F6> :call ProcessCtagsDatabase()<CR>
nnoremap <Leader><F7> :call ProcessCallTree()<CR>

"Load cctree.out for call tree use.
nnoremap <Leader><F8> :CCTreeLoadXRefDBFromDisk .vimfiles/cctree.out<CR><CR>

"Show/hide NerdTree file explorer on the left
nnoremap <Leader>nt :NERDTreeToggle<CR><CR>

"Show/hide tag list on the left
nnoremap <Leader>tt :TlistToggle<CR>

"Treating with whitespaces
nnoremap <Leader>wt :ToggleWhitespace<CR>
nnoremap <Leader>wr :StripWhitespace<CR>

"Toggle between absolute/relative line numbers
nnoremap <C-l> :call ToggleNumber()<CR>
"Toggle cursor column
nnoremap <C-k> :call ToggleCursorColumn()<CR>

"Call 'make' without locking vim
nnoremap <F10> :AsyncMake<CR>
nnoremap <Leader><F10> :AsyncMake debug=1<CR>

"highlight vertical line delimiter in a 'non-offensive' colour
highlight ColorColumn ctermbg=235 guibg=#2c2d27


"==============================[ COMMAND REFERENCE ]=================================
"
" gd             --> Find definition of the variable under cursor
" gf             --> Open file under cursor
" ga             --> Display ascii, hex and oktal value of character
" g8             --> Display hex value of utf-8 character
" g?{motion}     --> rot13 encryption
" :%s/old/new/gc --> Replace 'old' by 'new' with confirmation
" g ctrl-]       --> Function prototype and implementation via ctags
