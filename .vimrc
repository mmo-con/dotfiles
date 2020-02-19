"=====================================[ VIMRC ]======================================
"
" Author : Dr. Markus Moll
" Mail   : markus.moll.contact@gmail.com
" Date   : So 28. Okt 08:10:22 CET 2018
"
"
" Requirements:
"    + vim must be compiled with +python +cscope +conceal
"    + dependencies for full functionality:
"          * fzf
"          * cscope
"          * ctags
"          * silver_searcher
"
"    + Neomake Patch:
"        autoload/neomake.vim:661 : exe 'botright cwindow' height
"    + C.vim Patch:
"        .vim/bundle/cvim-master/plugin/c.vim:2605
"        Hard Deactivation of F9-shortcut. This is not configurable and interferes
"        with my own preferences.

"    + Command-T has a compiled component. Build it with
"        cd ~/.vim/bundle/command-t-master/ruby/command-t/ext/command-t
"        ruby extconf.rb
"        make
"
" Plugins:
" PATHOGEN        Gather plugins in seperate directories under .vim/bundle
"                 https://github.com/tpope/vim-pathogen
" EXPAND REGION   https://github.com/terryma/vim-expand-region
" BUFFER CLOSE    Close buffers without destruction of current splitting
"                 https://github.com/Gozala/.vim/blob/master/plugin/bclose.vim
" VIM-EASYMOTION  Jump anywhere by tag-highlighting
"                 https://github.com/Lokaltog/vim-easymotion
" MULTI-CURSORS   Edit at multiple cursors in parallel
"                 https://github.com/terryma/vim-multiple-cursors
" NERDTREE        File-manager inside vim
"                 https://github.com/scrooloose/nerdtree
" CVIM            Comprehensive C/C++ support for vim
"                 http://www.vim.org/scripts/script.php?script_id=213
" PERL-SUPPORT    Comprehensive Perl support for vim
"                 http://vim.sourceforge.net/scripts/script.php?script_id=556
" ULTISNIPS       Insert frequently used snippets
"     + SNIPPETS  https://github.com/sirver/ultisnips
"                 https://github.com/honza/vim-snippets
" BETTER-WSPACE   Highlight and remove unwanted whitespace
"                 https://github.com/ntpeters/vim-better-whitespace
" DELIMITE-MATE   Autoclose brackets
"                 https://github.com/Raimondi/delimitMate
" FUGITIVE        Git in Vim
"                 https://github.com/tpope/vim-fugitive
" GITV            Gitk-like repository handling (fugitive is a dependency)
"                 http://www.gregsexton.org/portfolio/gitv/
" VIM-DIFFA       Histogram-Diff algorithm for better results
"                 https://github.com/lambdalisue/vim-diffa
" GITGUTTER       Git repository changes on vims boundary
"                 https://github.com/airblade/vim-gitgutter
" VIMJSON         Json formatter
"                 https://github.com/elzr/vim-json
" VIMWIKI         Wiki and ToDo-Lists with vim
"                 https://github.com/vimwiki/vimwiki

"=================================[ GENERAL STUFF ]==================================

set nocp                     " No compatible mode with vi
let mapleader = ","          " Personal command prefix
call pathogen#infect()       " Use pathogen to organise plugins

filetype plugin on           " Load plugins depending on filetype
filetype indent on           " Indenting depending on filetype
syntax on                    " Activate syntax highlighting

scriptencoding utf-8         " Character encoding for this file

set nowrap                   " Turn off wrapping lines
set backspace=indent,start,eol " allow unrestricted backspacing in insert mode
set list                     " Show invisible text structure marks
set listchars=trail:•        " Mark trailing whitespace
set listchars+=tab:▷┅        " Mark real tabs
set listchars+=nbsp:⇆        " Mark nonbreakable whitespace
set listchars+=extends:❯     " Mark last column (if set nowrap)
set listchars+=precedes:❮    " Mark first column (if set nowrap)
set ttyfast                  " Assume fast terminal connection
set lazyredraw               " Do not redraw screen on commands not being typed
set title                    " Show title in console title bar
set autoread                 " Auto-read if file is changed from outside
set history=1000             " Remember last 1000 input lines
set undolevels=1000          " Take up to 1000 actions back
set nobackup                 " Turn off backups
set noswapfile               " Turn off swapfiles
set mouse=a                  " Allow mouse usage in all modes
set fileencoding=utf-8       " File encoding (writing!)
set encoding=utf-8           " File encoding (reading!)
set showmatch                " Show matching brackets
set showcmd                  " Show command in last line
set ruler                    " Show cursor position in line
set expandtab                " Use spaces instead of tabs
set smarttab                 " Use tabs smarter :-)
set tabstop=4                " An indentation each 4 spaces
set softtabstop=4            " Let backspace delete indent
set shiftwidth=4             " Numbers of spaces to (auto)indent
set cindent                  " Use C indentation pattern
set incsearch                " Incremental search
set noignorecase             " Case-sensitivity when searching
set hlsearch                 " Highlight search string in text
set relativenumber           " Show relative line numbers
set number                   " Show line number of current line
set textwidth=85             " Linebreak after n characters
set nofoldenable             " Really, really no code folding
set scrolloff=15             " Number of lines to keep above/below
set mat=5                    " Tenth of seconds blinking when matching brackets
set laststatus=2             " last window will always have statusline
set nofoldenable             " Do not allow code folding at startup
set foldmethod=indent        " Fold based on indent
set foldnestmax=1            " Deepest fold is 1 level
set synmaxcol=350            " No syntax highlighting for more than 350 cols
set colorcolumn=+1           " Show vertical bar at textwidth
set cursorline               " Highlight current line
"set spell                    " Use spell correction
"set spelllang=en_gb          " Define language for spell

" Remove comment leader when joining comment lines
if v:version > 703 || v:version == 703 && has('patch541')
    set formatoptions+=j
endif

" Precede wrapped lines with a little arrow
if has('linebreak')
    let &showbreak='⇆'
    set breakindent                " Indent wrapped lines to match start
    if exists('&breakindentopt')
        set breakindentopt=shift:2 " Emphasize broken lines by indenting them
    endif
endif

" allow cursor to move where there is no text in visual block mode
if has('virtualedit')
    set virtualedit=block
endif

if(has("gui_running"))
    set guioptions-=T
    set guioptions+=m
    set guioptions+=r
    set guioptions-=L
    "set guifont=Inconsolata\ 13
    "set guifont=Liberation\ Mono\ Regular\ 11
    "set guifont=Fira\ Code\ Retina\ 11
    "set guifont=CamingoCode\ Regular\ 11
    "set guifont=Input\ Mono\ Regular\ 11
    "set guifont=Fantasque\ Sans\ Mono\ 13
    set guifont=Droid\ Sans\ Mono\ Regular\ 11
    "set guifont=Monaco\ Regular\ 11
    "set guifont=Source\ Code\ Pro\ Medium\ 11
    colorscheme onedark
    set background=dark
    set lines=999 columns=999
else
    set t_Co=256
    set background=dark
    colorscheme onedark
    set termguicolors
endif

" Save when losing focus
augroup save_on_focus_lost
    au!
    au FocusLost * :silent! wall
augroup END

" Undo settings
set noundofile
"set undodir=~/.vim/tmp/undo//
"if !isdirectory(expand(&undodir))
    "call mkdir(expand(&undodir), "p")
"endif

" tagfile folders
let g:TagFilesBasePath       = "/media/data/.vimfiles/"  " Everything goes here!
let g:TagFilesCtagsFileStd   = "stdclib"                 " Tags for /usr/include
let g:TagFilesCtagsFileLocal = "localclib"               " Tags for local project
let g:TagFilesCscopeFileXref = "cscope.out"              " Cscope Xref Db
let g:TagFilesCtagsPathStd   = g:TagFilesBasePath . g:TagFilesCtagsFileStd
let g:TagFilesCtagsPathLocal = g:TagFilesBasePath . g:TagFilesCtagsFileLocal
let g:TagFilesCscopePathXref = g:TagFilesBasePath . g:TagFilesCscopeFileXref

exec 'set tags+=' . g:TagFilesCtagsPathStd
exec 'set tags+=' . g:TagFilesCtagsPathLocal

"===================================[ CODE STYLE ]===================================

set cinoptions=
set cinoptions+=>s  " Normal indent by shiftwidth
set cinoptions+=e0  " Modify indent +/-0 when /{$/
set cinoptions+=n0  " Modify indent +/-0 for braceless control block
set cinoptions+=f0  " First brace in column 0
set cinoptions+={1s " Modify opening brace indent by +/-1
set cinoptions+=}0  " Modify closing brace indent by +/-0
set cinoptions+=^0  " Modify indent inside braces by +/-0
set cinoptions+=:s  " Case labels are <sw> from switch()
set cinoptions+==0  " Modify case statement indent by +/-0
set cinoptions+=l1  " Align statements relative to case label
set cinoptions+=b0  " Align break with statements, not case label
set cinoptions+=g0  " Scope declarations align with braces
set cinoptions+=hs  " Statements after scope statements are indented <sw>
set cinoptions+=ps  " K&R parameters are indented <sw>
set cinoptions+=ts  " Return type declarations are indented <sw>
set cinoptions+=is  " Indent C++ base classes and cinits <sw>
set cinoptions+=+s  " Indent continuation lines <sw>
set cinoptions+=c3  " Indent comment lines +3 after comment opener.
set cinoptions+=C0  " Comments behave correctly
set cinoptions+=/0  " Indent comments <sw> extra
set cinoptions+=(0  " Indent continuation in unclosed parens 2<sw>
set cinoptions+=u0  " Same as above, one level deeper, add <sw>
set cinoptions+=U0  " Ignore (/u if parens is first non-ws char.
set cinoptions+=w1  " Line up with first unclosed paren.
set cinoptions+=W0  " Unclosed paren change.
set cinoptions+=m0  " Parens line up properly
set cinoptions+=M0  " Parens line up properly
set cinoptions+=j1  " Anonymous classes are indented correctly.
set cinoptions+=)20 " Unclosed parens up to 20 lines away
set cinoptions+=*30 " Unclosed comments up to 30 lines away

"=================================[ WILD IGNORES ]===================================

set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files

"===================================[ MAPPINGS ]=====================================

" Mail-greetings-blabber
iab mfg Mit freundlichen Grüüßßen
        \<CR>Markus Moll<ESC>
iab mbg Viele Grüüßße
        \<CR>Markus<ESC>
iab mlg Liebe Grüüßße
        \<CR>Markus<ESC>

" Insert current time/date
nnoremap <Leader>D :r!date<cr>

" Where are we?
nnoremap <Leader>P :!pwd<cr>

" If terminal is broken again ...
nnoremap <Leader>R :redraw!<cr>

" Sort lines
vnoremap <Leader>S :!sort<cr>

" Quickly leave insertmode
imap jk <Esc>

" Search for non-ASCII symbols
nnoremap <Leader>na /[^\x00-\x7F]<CR>

" Quickly save all buffers
nnoremap <Leader>w :wa<cr>

" Quickly exit
nnoremap <C-q> :wqa<cr>

" Navigation on jklö (for german qwertz keyboard layout!)
noremap ö l
noremap l k
noremap k j
noremap j h

" Adapt the customized navigation to window navigation, too
noremap <Space>ö <c-w>l
noremap <Space>l <c-w>k
noremap <Space>k <c-w>j
noremap <Space>j <c-w>h

nnoremap <C-left>  :vs<cr>
nnoremap <C-right> :vs<cr>
nnoremap <C-up>    :sp<cr>
nnoremap <C-down>  :sp<cr>

" Kill current buffer without destroying the buffer-structure
nnoremap <up> :Kwbd<cr>
nnoremap <C-c> :Kwbd<cr> ZZ<cr>

" Quickfix navigation
nnoremap <F5> :botright copen<CR>
nnoremap <Leader><F5> :cclose<CR>
nnoremap <F6> :cnext<CR>
nnoremap <Leader><F6> :cprevious<CR>
nnoremap <F7> :colder<CR>
nnoremap <Leader><F7> :cnewer<CR>

" Remove search match highlighting
noremap <silent> <Leader><space> :noh<cr>:call clearmatches()<cr>

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap { {zz
nnoremap } }zz

" No german Sonderzeichen ...
inoremap ü ue
inoremap ö oe
inoremap ä ae
inoremap ß ss

" ... or only if really necessary.
inoremap üü ü
inoremap öö ö
inoremap ää ä
inoremap ßß ß

" Jump to beginning/end of line
noremap H ^
noremap L $
vnoremap L g_

" Quick editing of frequently used files
nnoremap <Leader>ev :e $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>

" Working with split screen nicely
" Resize Split when the window is resized
augroup equal_when_resized
    au!
    au VimResized * :wincmd =
augroup END

" Surround word under cursor with \" or \'
nnoremap <Leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <Leader>' viw<esc>a'<esc>hbi'<esc>lel

" [S]plit lines (as counterpart to [J]oin lines)
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Better indentation
vnoremap < <gvh
vnoremap > >gvh

" Copy current file path to clipboard
nnoremap <leader>% :call CopyCurrentFilePath()<CR>
function! CopyCurrentFilePath()
    let @+ = expand('%:p')
    echo @+
endfunction

" Incremental search for visual selection
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" Dont move on '*'
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>
                 \*:call winrestview(stay_star_view)<cr>
nnoremap <silent> # :let stay_star_view = winsaveview()<cr>
                 \#:call winrestview(stay_star_view)<cr>

" incremental forward/backward search for visual selection
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" Easy autocomplete
inoremap <C-space> <C-x><C-o>

"============================[ FUNCTIONS / MINI-PLUGINS ]============================

" Dimming inactive splits using the colorcolumn feature
"function! s:DimInactiveWindows()
  "for i in range(1, tabpagewinnr(tabpagenr(), '$'))
    "let l:range = ""
    "if i != winnr()
      "if &wrap
        "" HACK: when wrapping lines is enabled, we use the maximum number
        "" of columns getting highlighted. This might get calculated by
        "" looking for the longest visible line and using a multiple of
        "" winwidth().
        "let l:width=256 " max
      "else
        "let l:width=winwidth(i)
      "endif
      "let l:range = join(range(1, l:width), ',')
    "endif
    "call setwinvar(i, '&colorcolumn', l:range)
  "endfor
"endfunction
"
"augroup DimInactiveWindows
  "au!
  "au WinEnter * call s:DimInactiveWindows()
  "au WinEnter * set cursorline
  "au WinLeave * set nocursorline
"augroup END


" Highlight Word
" --------------
" This mini-plugin provides a few mappings for highlighting words temporarily.
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily. You can search for it, but that only
" gives you one color of highlighting. Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

nnoremap <silent> <A-1> :call HiInterestingWord(1)<cr>
nnoremap <silent> <A-2> :call HiInterestingWord(2)<cr>
nnoremap <silent> <A-3> :call HiInterestingWord(3)<cr>
nnoremap <silent> <A-4> :call HiInterestingWord(4)<cr>
nnoremap <silent> <A-5> :call HiInterestingWord(5)<cr>
nnoremap <silent> <A-6> :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" Functions for the generation of cscope databases
" ------------------------------------------------
function! CollectCscopeFileNames()
    " Collect all the files you want the tags to be generated for
    " and write them to the vimfiles directory. Files with weird
    " suffixes or without any suffix at all must be stated seperately.
    " There are two reasons for this detour: 1. we dont want to generate
    " tags for scripts and config files that are maybe located in the
    " project folder and 2. we dont want vim.grep to search the tagfiles
    " that are otherwise stored in the project folder.
    exec "silent! !find %:p:h -maxdepth 1 -name '*.c' -o -name '*.h'" .
                  \" -o -name '*.cpp' -o -name '*.hpp' -o -name 'structh'" .
                  \" -o -name 'ainclude' -o -name 'ariglobs' -o -name 'mkglobs'" .
                  \" -o -name 'mixglob' -o -name 'prototyp' -o -name 'vardimh'" .
                  \" -o -name 'mk_txt'" .
                  \" > " . g:TagFilesBasePath . "cscope.files"
endfunction

function! ProcessCscopeDatabase()
    " The function firstly generates 'cscope.files' and then generates
    " the cscope database
    if !isdirectory(g:TagFilesBasePath)
        call mkdir(g:TagFilesBasePath)
    endif
    silent! call CollectCscopeFileNames()
    " The following is a workaround. The cscope database is created
    " incorrectly when cscope is called from the project folder. Changing into
    " the tag-subdirectory solves the problem - not clear why.
    let l:cwd=expand("%:p:h")
    exec "cd " . g:TagFilesBasePath
    exec "silent! !cscope -i " . g:TagFilesBasePath . "cscope.files -cbqk -f " .
            \ g:TagFilesBasePath . g:TagFilesCscopeFileXref
    silent! :cs reset
    exec "cd " . l:cwd
    exec "silent! :cs add " . g:TagFilesBasePath . g:TagFilesCscopeFileXref
    echo "Processed cscope database."
endfunction

function! LoadCallTree()
    exec "CCTreeLoadXRefDBFromDisk " . g:TagFilesBasePath . "cctree.out"
endfunction

function! ProcessCallTree()
    " The function generates the database for the use of calltrees
    if !isdirectory(g:TagFilesBasePath)
        call mkdir(g:TagFilesBasePath)
    endif
    " Load Cscope Database and save it in native crossref format
    exec "silent! CCTreeLoadDB " . g:TagFilesCscopePathXref
    exec "silent! CCTreeSaveXRefDB " . g:TagFilesBasePath . "cctree.out"
endfunction


" Generation of ctags databases
" -----------------------------
function! ProcessCtagsDatabase()
    if !isdirectory(g:TagFilesBasePath)
        call mkdir(g:TagFilesBasePath)
    endif
    " Generate stdlib database only once
    if empty(glob(g:TagFilesCtagsPathStd))
        exec "silent! !ctags -R -f " . g:TagFilesCtagsPathStd . " --sort=yes --c++-kinds=+p --fields=+iaS"
                 \ "--extra=+qf --language-force=C++ --tag-relative=yes /usr/include/c++"
    endif
    " Generate Tag-file for local project files
        exec "silent! !ctags -f " . g:TagFilesCtagsPathLocal . " -h=\"+.\" --language-force=C++ --sort=yes"
                        \ "--c++-kinds=+p --fields=+iaS --extra=+qf --tag-relative=yes *"
    echo "Processed ctags database."
endfunction

" Toggle between absolute/relative line numbers
" ---------------------------------------------
function! ToggleNumber()
    if(&relativenumber)
        set norelativenumber
    else
        set relativenumber
    endif
    set number
endfunc

" Toggle vertical bar for cursorposition
" --------------------------------------
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

" Set Hafas Dir
" -------------
function! SetHafasDir()
    call inputsave()
    let $HAFAS_DIR=input("Enter Hafas Dir: ", "", "file")
    call inputrestore()
    if !isdirectory(expand($HAFAS_DIR))
        echo "\nError: << " . $HAFAS_DIR . " >> does not exist."
    else
        echo "\nHafas Dir set to: << " . $HAFAS_DIR . " >>."
    endif
endfunction

function! VimDbg()
    packadd termdebug
    let g:termdebug_wide = 163 " Vertical split debugger
    call inputsave()
    let l:dbg_cmd=input("Debug-Binary [parameters]: ", "", "file")
    call inputrestore()
    exec 'TermdebugCommand ' . l:dbg_cmd
endfunction


"============================[ PLUGIN CONFIGURATIONS ]===============================

"====================================[ AGREP ]=======================================

nnoremap <silent><leader>g :Agrep <cword> *<cr>
nnoremap <silent><leader>T :Agrep 'TODO \[mmo' *<cr>
nnoremap <F6> :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cn' : 'Anext')<CR>
nnoremap <Leader><F6> :<C-U>exe v:count1.(bufwinnr('Agrep') == -1 ? 'cp' : 'Aprev')<CR>
nnoremap <Leader>a :Aclose<CR> :bdelete Agrep<CR>

let g:agrep_default_flags = '-I -s --exclude=CHANGELOG'

"====================================[ GIT ]=========================================

nnoremap <Leader>ggs :Gstatus<CR>
nnoremap <Leader>ggt :Gitv!<CR>
nnoremap <Leader>ggl :Gitv --all<CR>

"==================================[ NEOMAKE ]=======================================

let g:neomake_hafas_release_maker = {
    \ 'exe': 'make',
    \ 'args': ['-j4'],
    \ 'errorformat': '%f:%l:%c: %m'
    \ }

let g:neomake_hafas_debug_maker = {
    \ 'exe': 'make',
    \ 'args': ['-j4', 'debug=1'],
    \ 'errorformat': '%f:%l:%c: %m'
    \ }

let g:neomake_transform_release_maker = {
    \ 'exe': 'make',
    \ 'args': [],
    \ 'errorformat': '%f:%l:%c: %m'
    \ }

let g:neomake_transform_debug_maker = {
    \ 'exe': 'make',
    \ 'args': ['debug=1'],
    \ 'errorformat': '%f:%l:%c: %m'
    \ }

function! SetWarningType(entry)
    if a:entry.type =~? '\m^[SPI]'
        let a:entry.type = 'I'
    endif
endfunction

let g:neomake_cppcheck_maker = {
    \ 'args': ['%:p', '-q', '--enable=warning,style,performance,portability'],
    \ 'errorformat': '[%f:%l]: (%trror) %m,' .
    \ '[%f:%l]: (%tarning) %m,' .
    \ '[%f:%l]: (%ttyle) %m,' .
    \ '[%f:%l]: (%terformance) %m,' .
    \ '[%f:%l]: (%tortability) %m,' .
    \ '[%f:%l]: (%tnformation) %m,' .
    \ '[%f:%l]: (%tnconclusive) %m,' .
    \ '%-G%.%#',
    \ 'postprocess': function('SetWarningType')
    \ }

let g:neomake_warning_sign = {'text': '!!', 'texthl': 'NeomakeWarningSign'}
let g:neomake_remove_invalid_entries = 1
let g:neomake_open_list = 2

nnoremap <Leader>mhr :Neomake! hafas_release<CR>
nnoremap <Leader>mhd :Neomake! hafas_debug<CR>
nnoremap <Leader>mtr :Neomake! transform_release<CR>
nnoremap <Leader>mtd :Neomake! transform_debug<CR>
nnoremap <Leader>mcp :Neomake! cppcheck<CR>

function! NeomakeFinishMsg()
    let l:jobinfo = g:neomake_hook_context.jobinfo
    echo "Maker '" . l:jobinfo['maker']['name'] .
                \ "' finished with exitcode " . l:jobinfo['exit_code']
endfunction

augroup my_neomake_hooks
    au!
    autocmd User NeomakeJobFinished nested call NeomakeFinishMsg()
augroup END

"=================================[ COMMAND-T ]======================================

"let g:CommandTMaxDepth = 3
"let g:CommandTFileScanner = "find"
"let g:CommandTWildIgnore = '*/linux/*,*/linux64/*,*/RCS/*'
"let g:CommandTScanDotDirectories = 0
"let g:CommandTInputDebounce = 50
"let g:CommandTMaxCachedDirectories = 10

"nnoremap <C-g> :CommandT<CR>
"nnoremap <C-h> :CommandTTag<CR>
"nnoremap <Leader>ch :CommandTHistory<CR>
"nnoremap <Leader>cl :CommandTLine<CR>

"==================================[ NERDTREE ]======================================

let NERDTreeWinSize = 25
let NERDTreeMinimalUI = 1
let NERDTreeStatusline = 0
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 0
let NERDTreeRespectWildIgnore = 1
let NERDTreeDirArrowExpandable = '+'
let NERDTreeDirArrowCollapsible = '-'

nnoremap <Leader><F8> :NERDTreeToggle<CR>:wincmd =<CR>
nnoremap <Leader>cp :NERDTreeClose<CR>:bufdo bd<CR>:NERDTree<CR>

"==================================[ TAGLIST ]=======================================

let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"

nnoremap <silent> <F8> :TlistToggle<CR>:wincmd =<CR>

"====================================[ CVIM ]========================================

let g:C_LineEndCommColDefault = 35
let g:C_LoadMenus             = 'no'

"===================================[ CSCOPE ]=======================================

if has("cscope")
    set cst      " Search cscope and tag files
    set csto=0   " Search first cscope then tag files
    set nocsverb
    " Add any database in current directory
    if filereadable(g:TagFilesCscopePathXref)
        exec "cs add " . g:TagFilesCscopePathXref
    " Else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    " Use quickfix window to show results
    set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-,a-
    set cscopepathcomp=3
    set csverb
    set cscopetag
    " set cscopeverbose "Inform when different DB is added
    " 's' symbol:   Find all references to the token under cursor
    " 'g' global:   Find global definition(s) of the token under cursor
    " 'c' calls:    Find all calls to the function name under cursor
    " 't' text:     Find all instances of the text under cursor
    " 'e' egrep:    Egrep search for the word under cursor
    " 'f' file:     Open the filename under cursor
    " 'i' includes: Find files that include the filename under cursor
    " 'd' called:   Find functions that function under cursor calls
    " nnoremap <F1> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <F2> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <F3> :cs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <F4> :cs find a <C-R>=expand("<cword>")<CR><CR>
    " Same mappings but open in split view
    " nnoremap <Leader><F1> :scs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <Leader><F2> :scs find g <C-R>=expand("<cword>")<CR><CR>
    nnoremap <Leader><F3> :scs find s <C-R>=expand("<cword>")<CR><CR>
    nnoremap <Leader><F4> :scs find a <C-R>=expand("<cword>")<CR><CR>
endif

"===============================[ PERL-SUPPORT ]=====================================

let g:Perl_Debugger = "ptkdb"

"==============================[ RAINBOW-DELIM ]=====================================

let g:rcsv_delimiters = [",", ";"]
let g:disable_rainbow_csv_autodetect = 1

nnoremap <F11> :RainbowDelimQuoted<CR>
nnoremap <Leader><F11> :RainbowNoDelim<CR>

"=================================[ ULTISNIPS ]======================================

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"=============================[ BETTER-WHITESPACE ]==================================

nnoremap <Leader>bt :ToggleWhitespace<CR>
nnoremap <Leader>br :StripWhitespace<CR>

set completeopt=menuone,menu,longest,preview

"===============================[ YOUCOMPLETEME ]====================================

let g:ycm_path_to_python_interpreter='/usr/bin/python3'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filetype_whitelist = { 'c' : 1, 'cpp' : 1, 'h' : 1, 'hpp' : 1, 'python' : 1}
let g:ycm_disable_for_files_larger_than_kb = 2500
let g:ycm_semantic_triggers = {'python': ['re!from\s+\S+\s+import\s']}
let g:ycm_global_ycm_extra_conf = '/home/mmo/.ycm_extra_conf.py'

" This way we can set project specific tag files and ycm completion
" with nerdtree <leader>cp project-change fake!
"augroup SetTagsOnChDir
    "au!
    "au DirChanged * echo "I noticed that!!!"
"augroup END

nnoremap <F1> :YcmCompleter GoToDeclaration <cword><CR>
nnoremap <leader><F1> :sp<cr> :YcmCompleter GoToDeclaration <cword><CR>

"=================================[ LIGHTLINE ]======================================

let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
\ }

"==================================[ SIGNIFY ]=======================================

let g:signify_vcs_list = [ 'git' ]

"=================================[ BUFTABLINE ]=====================================

let g:buftabline_numbers = 2

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

"=================================[ PYTHON-MODE ]=====================================

nnoremap <F12> :!python %<cr>

"=====================================[ ALE ]=========================================

let g:ale_set_loclist=0
let g:ale_set_quickfix=1
let g:ale_linters = {'c': []}

"===================================[ FZF ]==========================================

nnoremap <silent> <C-a> :Ag<CR>
nnoremap <silent> <C-b> :BLines<CR>
nnoremap <silent> <C-f> :BCommits<CR>
nnoremap <silent> <C-g> :FZF<CR>
nnoremap <silent> <C-h> :Tags<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')

let g:fzf_commits_log_options = '--color=always --date=short --pretty=format:"%C(yellow)%h%C(reset) %C(green)%ad%C(reset) %C(red)|%C(reset) %s %C(bold blue)[%an]%C(reset)%C(yellow)%C(reset)"'

"=================================[ VIMWIKI ]========================================

let wiki_1 = {}
let wiki_1.path = '~/.vim/wiki/todo/'
let wiki_1.path_html = '~/.vim/wiki/todo/html/'
let wiki_1.auto_export = 1

let wiki_2 = {}
let wiki_2.path = '~/.vim/wiki/hacon/'
let wiki_2.path_html = '~/.vim/wiki/hacon/html/'
let wiki_2.auto_export = 1

let g:vimwiki_list = [wiki_1, wiki_2]

"===================================[ MISC ]=========================================

" Pretty printing Json-files
nnoremap <Leader>ppj :%!python -m json.tool<CR>

" Prev/Next-Diff in diff-mode and buffer-cycling else for arrow-{left,right}
nnoremap <expr> <left> &diff ? '[c' : ':bp<cr>'
nnoremap <expr> <right> &diff ? ']c' : ':bn<cr>'

" Toggle between absolute/relative line numbers
nnoremap <C-l> :call ToggleNumber()<CR>

" Toggle cursor column
nnoremap <C-k> :call ToggleCursorColumn()<CR>

" Set Hafas Dir
nnoremap <Leader>hd :call SetHafasDir()<cr>
nnoremap <Leader>drb :!linux/rel/batch.exe<cr>
nnoremap <Leader>ddb :!linux/dbg/batch.exe<cr>

" Adding Termdebug and choose binary to debug
nnoremap <leader>dbg :call VimDbg()<CR>

" Quickly jump to tag
nnoremap <F10> :tag 

" Generate Databases
nnoremap <F9> :call ProcessCtagsDatabase()<CR> :call ProcessCscopeDatabase()<CR> :redraw!<CR>

" Custom ToDo-Comments
nnoremap <Leader>td O/* TODO [mmo <Esc>"=strftime("%Y-%m-%d %H:%M:%S")<CR>pa]: */
                        \<Esc>o/*                                 */<Esc>
                        \<Esc>o/* ------------------------------- */<Esc>kBF*llR
inoremap <Leader>td /* TODO [mmo <Esc>"=strftime("%Y-%m-%d %H:%M:%S")<CR>pa]: */
                        \<Esc>o/*                                 */<Esc>
                        \<Esc>o/* ------------------------------- */<Esc>kBF*llR


" highlight vertical line delimiter in a 'non-offensive' colour
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

"================================[ DEPRECATED ]======================================

"=============================[ SELECTED MAPPINGS ]==================================

" [<Leader>] <F1>  => GoTo Declaration of token under cursor [split]
" [<Leader>] <F2>  => GoTo Definition definition(s) of token under cursor [split]
" [<Leader>] <F3>  => Find all refs of token under cursor [split]
" [<Leader>] <F4>  => Find all places where token under cursor is assigned a value [split]
" [<Leader>] <F5>  => Open [close] the quickfix window
" [<Leader>] <F6>  => Stepping forward [backward] through quickfix window
" [<Leader>] <F7>  => Go to older [newer] quickfix-list
" [<Leader>] <F8>  => Toggle Tagbar [Nerdtree]
"            <F9>  => Generate Cscope- & Ctags-Databases
"            <F10> => Open tag-command-line-input
" [<Leader>] <F11> => Activate [Deactivate] CSV-rainbow colors
"
" <Ctrl-g>         => Fuzzy File Search
" <Ctrl-f>         => Fuzzy Git commit search
" <Ctrl-b>         => Fuzzy Line (in buffer) search

"==============================[ NICE COLORTHEMES ]==================================

" GRUVBOX     https://github.com/morhetz/gruvbox
" YAFLANDIA   https://github.com/JBakamovic/yaflandia
