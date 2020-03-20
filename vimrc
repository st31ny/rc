"------------------------------------------------------------
""" vimrc
" sources:
"  * http://vim.wikia.com/wiki/Example_vimrc
"  * https://github.com/junegunn/vim-plug
"------------------------------------------------------------

" Debian packages:  vim vim-gtk vim-addon-manager
"                   vim-youcompleteme
"                   fonts-powerline (for airline)
"                   cscope (for CCTree)
"                   cppman

let vim_dir = "$HOME/.vim"

set nocompatible

" Plug
"   PlugInstall [name ...] [#threads]   Install plugins
"   PlugUpdate [name ...] [#threads]    Install or update plugins
"   PlugClean[!]                        Remove unused directories (bang version
"                                       will clean without prompt)
"   PlugUpgrade                         Upgrade vim-plug itself
"   PlugStatus                          Check the status of plugins
"   PlugDiff                            Examine changes from the previous
"                                       update and the pending changes
"   PlugSnapshot[!] [output path]       Generate script for restoring the
"                                       current snapshot of the plugins
"
" bootstrap plug
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
source ~/.vim/bundle/vim-plug/plug.vim
call plug#begin('~/.vim/bundle')

" Plug Options
"   branch/tag/commit       Branch/tag/commit of the repository to use
"   rtp                     Subdirectory that contains Vim plugin
"   dir                     Custom directory for the plugin
"   as                      Use different name for the plugin
"   do                      Post-update hook (string or funcref)
"   on                      On-demand loading: Commands or <Plug>-mappings
"   for                     On-demand loading: File types
"   frozen                  Do not update unless explicitly specified

Plug 'junegunn/vim-plug'

" better defaults for vim
Plug 'tpope/vim-sensible'

Plug 'steinymity/minibufexpl.vim'

Plug 'wesQ3/vim-windowswap'
" Go to source window, <leader>ww, go to other window, <leader>ww

"Plug 'edkolev/tmuxline.vim'
Plug 'micbou/a.vim'
Plug 'chrisbra/csv.vim'

Plug 'airblade/vim-gitgutter'
" possible alternative: https://github.com/mhinz/vim-signify

Plug 'rhysd/committia.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/denite.nvim'

Plug 'edkolev/promptline.vim'
" Call
"     :PromptlineSnapshot ~/.shell.d/prompt.sh airline
" to generate promptline (can be sourced from zsh/bash).

Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'rust-lang/rust.vim'
Plug 'steinymity/vim-capnp'
Plug 'dcbaker/vim-firejail'

Plug 'chrisbra/NrrwRgn'
" Select a block & type :NR to zoom in, edit the block & finish with :w

Plug 'hari-rangarajan/CCTree'
" Display call graph with cscope. See docs.

Plug 'kshenoy/vim-signature'
" place, toggle and display marks
" m,    set mark
" m.    delete mark
" m-    delete all marks on current line
" m<space> delete all marks
" m/    show list

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'

Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" HTML markup with <C-E>

Plug 'vim-scripts/bufexplorer.zip'

Plug 'vim-scripts/securemodelines'
" only allow some settings via modelines
Plug 'vim-scripts/Justify'
" Justify text
Plug 'vim-scripts/Align'
" Align text at operators
Plug 'vim-scripts/matchit.zip'
" Use % to cycle around matching opening/closing tags

Plug 'vim-scripts/ctrlp.vim'
" Use Ctrl-p to seach for files/buffers/...

Plug 'vim-scripts/The-NERD-Commenter'
" [count]<leader>c<space> NERDComToggleComment

Plug 'vim-scripts/vim-lastplace'

Plug 'vim-scripts/surround.vim'
" See :help surround.

Plug 'vim-scripts/calendar.vim', { 'on': 'Calendar' }
" call :Calendar

Plug 'vim-scripts/DetectIndent'
Plug 'oplatek/Conque-Shell', { 'on': [ 'ConqueTerm', 'ConqueTermSplit', 'ConqueTermTab', 'ConqueTermVSplit' ] }

Plug 'vim-scripts/deb.vim'
" browse deb archives

Plug 'altercation/vim-colors-solarized'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" required for vim-vebugger
Plug 'idanarye/vim-vebugger'

Plug 'tpope/vim-dispatch'
" :Make     run make in tmux/foreground
" :Make!    run make in background
" :Copen    view background results
" Honors vim's compiler support (:compiler)

Plug 'sfiera/vim-emacsmodeline'
" Support emacs file variables (aka modelines)

Plug 'vim-scripts/sgmlendtag'
" Insert SGML/XML end tag automatically

Plug 'vim-scripts/netrw.vim'
" Edit files remotely

Plug 'vim-scripts/ScreenShot'
" Take screenshots from vim
"  :ScreenShot -- to make screenshot itself
"  :Text2Html -- to generate HTML code for syntax highlighting
"  :Diff2Html -- to display two files comparing with differencies highlighted

Plug 'powerman/vim-plugin-AnsiEsc'
" Interpret ANSI escape codes
"  :AnsiEsc

" Initialize plugin system
call plug#end()

"------------------------------------------------------------
" Basic vim config
"

" Enable syntax highlighting
syntax on

" Allow re-using windows for multiple buffers
set hidden

" set complete=".,w,b,u,t,i,k"

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Set 3 lines to the cursor
set scrolloff=3

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a
" enable mouse past column 223
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Highlight current line
set cursorline
"set cursorcolumn
"nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Highlight whitespaces
set list listchars=tab:>-,trail:·

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>

" Don't redraw while executing macros (performance)
set lazyredraw

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Persistent Undo
if has("persistent_undo")
    let myundodir = expand(vim_dir . '/undo')
    call system('mkdir -p ' . myundodir)
    let &undodir = myundodir
    set undofile
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif

" Swap/backup dir
let myswapdir = expand(vim_dir . '/swap')
call system('mkdir -p ' . myswapdir)
let &directory = myswapdir
let &backupdir = myswapdir

"------------------------------------------------------------
" Functions
"
" Move a window to the previous tab
function! MoveWinToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
command! -bang MoveWinToPrevTab call MoveWinToPrevTab()

" Move a window to the next tab
function! MoveWinToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc
command! -bang MoveWinToNextTab call MoveWinToNextTab()

"------------------------------------------------------------
" Mappings
"
:let mapleader = ","

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
noremap <silent> Y y$a

" <F2> saves a file and restores the mode
nnoremap <silent> <F2> :w<CR>
vmap <silent> <F2> <Esc><F2>gv
imap <silent> <F2> <c-o><F2>

"" Buffer Management
" <F3>, <F4>: switch between buffers
"nnoremap <silent> <F3> gT
"nnoremap <silent> <F3> :bp<cr>
"vmap <silent> <F3> <Esc><F3>gv
"imap <silent> <F3> <c-o><F3>

"nnoremap <F4> gt
"nnoremap <F4> :bn<cr>
"vmap <F4> <Esc><F4>gv
"imap <F4> <c-o><F4>

" delete buffer
noremap <silent> <Leader>bd :bd<cr>

"" Tab stuff
noremap <silent> <Leader>ts :tab split<cr>
noremap <silent> <Leader>tn :tab new<cr>
noremap <silent> <Leader>tc :tab close<cr>

" move tab around
nnoremap <silent> <Leader>gT :tabmove -1<CR>
nnoremap <silent> <Leader>gt :tabmove +1<CR>

" Move windows between tabs
nnoremap <silent> <C-w>gT :call MoveWinToPrevTab()<CR>
nnoremap <silent> <C-w>gt :call MoveWinToNextTab()<CR>

"" <F5>, <F6>: forward -- backward
nnoremap <silent> <F5> <c-o>
vmap <silent> <F5> <Esc><F5>gv
imap <silent> <F5> <c-o><F5>

nnoremap <silent> <F6> <c-i>
vmap <silent> <F6> <Esc><F6>gv
imap <silent> <F6> <c-o><F6>

"" Folding
inoremap <silent> <F8> <C-O>za
nnoremap <silent> <F8> za
onoremap <silent> <F8> <C-C>za
vnoremap <silent> <F8> zf
inoremap <silent> <C-F8> <C-O>zfa}
nnoremap <silent> <C-F8> zfa}
onoremap <silent> <C-F8> <C-C>zfa}
vnoremap <silent> <C-F8> zf
set foldcolumn=1

" F9 - Make
nnoremap <silent> <F9> :w<bar>:Make<cr>
vmap <silent> <F9> <Esc><F9>gv
imap <silent> <F9> <c-o><F9>

"" Registers
" see http://vim.wikia.com/wiki/Comfortable_handling_of_registers
" and http://vim.wikia.com/wiki/Accessing_the_system_clipboard

"" copy filename to clipboard
nnoremap <silent> <Leader>cf :let @+=expand("%")<CR>
nnoremap <silent> <Leader>cp :let @+=expand("%:p")<CR>

" with F7 copy all current buffer to clipboard, or a selection.
" with shift-F7, paste all clipboard contents
" copy to/paste from x
vnoremap <silent> <F7> "+ygv"zy`>
nnoremap <silent> <F7> "+p
inoremap <silent> <F7> <C-r><C-o>+
vnoremap <silent> <S-F7> "+p`]
cnoremap <silent> <F7> <C-r><C-o>+

" easy access to x register
noremap <S-x> "+

" copy x register to standard register and vice versa
nnoremap <silent> rx :let @x=@" \| let @"=@+ \| let @+=@x<CR>

" print register contents
nnoremap <silent> rp :reg<CR>

" update DNS SOA timestamp
nnoremap ,soa /\<\d\{10}\><CR>ce<C-r>=strftime("%Y%m%d00")<CR><Esc>:echo @"<CR>

"------------------------------------------------------------
" Plugin configuration

"" YouCompleteMe (deb)
" uncomment to disable ycm
"let g:loaded_youcompleteme = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/ycm_extra_conf.py"
nnoremap <silent> <C-G> :YcmCompleter GoTo<CR>

"" committia
" You can get the information about the windows with first argument as a
" dictionary.
"
"   KEY              VALUE                      AVAILABILITY
"---------------------------------------------------------------------
"   vcs            : vcs type (e.g. 'git')   -> all hooks
"   edit_winnr     : winnr of edit window    -> ditto
"   edit_bufnr     : bufnr of edit window    -> ditto
"   diff_winnr     : winnr of diff window    -> ditto
"   diff_bufnr     : bufnr of diff window    -> ditto
"   status_winnr   : winnr of status window  -> all hooks except for
"                                               'diff_open' hook
"   status_bufnr   : bufnr of status window  -> ditto

let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " map <C-n> and <C-p>
    inoremap <silent> <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    inoremap <silent> <buffer><C-p> <Plug>(committia-scroll-diff-up-half)

endfunction

"" NERDTree
" start automatically if vim is called without file argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" start with vertical split when opening dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close if NERDTree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" key bindings
noremap <silent> <C-n> :NERDTreeToggle<CR>

"" BufExplorer
noremap <silent> <Leader>l :BufExplorer<CR>

"" MiniBufExplorer
let g:miniBufExplorerAutoStart = 1
let g:miniBufExplCycleArround = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplStatusLineText = "[MiniBufExplorer]"
let g:miniBufExplTabWrap = 1
let g:miniBufExplBuffersNeeded = 1

let g:miniBufExplSortBy = "number"

function! ToggleMRU()
    if exists("g:MBEStateIsMRU")
        nnoremap <silent> <F4>    :MBEbn<CR>
        nnoremap <silent> <F3>    :MBEbp<CR>
        unlet g:MBEStateIsMRU
    else
        nnoremap <silent> <F3>    :MBEbf<CR>
        nnoremap <silent> <F4>    :MBEbb<CR>
        let g:MBEStateIsMRU = 1
    endif
    MBEToggleMRUAll
endfunc


" open/close/toggle/focus MBE
noremap <silent> <Leader>mo :MBEOpenAll<cr>
noremap <silent> <Leader>mc :MBECloseAll<cr>
noremap <silent> <Leader>me :MBEToggleAll<cr>
noremap <silent> <Leader>mm :call ToggleMRU()<cr>
noremap <silent> <Leader>mf :MBEFocus<cr>

" close current buffer
noremap <silent> <Leader>q :MBEbd<cr>

" ctrl + arrow key to navigate windows
noremap <silent> <C-Down>  <C-W>j
noremap <silent> <C-Up>    <C-W>k
noremap <silent> <C-Left>  <C-W>h
noremap <silent> <C-Right> <C-W>l
noremap! <silent> <C-Down>  <C-O><C-W>j
noremap! <silent> <C-Up>    <C-O><C-W>k
noremap! <silent> <C-Left>  <C-O><C-W>h
noremap! <silent> <C-Right> <C-O><C-W>l

" switch buffers
nnoremap <silent> <F3>        :MBEbp<CR>
nnoremap <silent> <F4>        :MBEbn<CR>

vmap <silent> <F3> <Esc><F3>gv
imap <silent> <F3> <c-o><F3>
vmap <silent> <F4> <Esc><F4>gv
imap <silent> <F4> <c-o><F4>

" next/previous (number ordering)
noremap <silent> <Leader>mn  :MBEbn<CR>
noremap <silent> <Leader>mp  :MBEbp<CR>
" forward/backward (mru ordering)
noremap <silent> <Leader>mb  :MBEbb<CR>
noremap <silent> <Leader>mf  :MBEbf<CR>

"" Alternate
noremap <silent> <Leader>aa   :A<CR><CR>
noremap <silent> <Leader>as  :AS<CR>
noremap <silent> <Leader>av  :AV<CR>
noremap <silent> <Leader>at  :AT<CR>

let g:alternateExtensions_{'hh'} = "cc,cpp,cxx"
let g:alternateExtensions_{'cc'} = "h,hh,hpp"
let g:alternateExtensions_{'cpp'} = "h,hh,hpp"
let g:alternateExtensions_{'cxx'} = "h,hh,hpp"

"" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

"" Secure-Modelines
"let g:secure_modelines_verbose=1

"" Airline
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Don't show buffers, we have MBE for that
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#tab_min_count = 2

let g:airline#extensions#whitespace#enabled = 1

"" Tagbar
" Integrates in Airline
noremap <silent> <C-T> :TagbarToggle<cr>

"" fugitive
" git integration
" possible alternative: https://github.com/jreybert/vimagit
noremap <silent> <Leader>gs :Gstatus<cr>
noremap <silent> <Leader>gf :Gfetch<cr>
noremap <silent> <Leader>gm :Gmerge<cr>
noremap <silent> <Leader>gp :Gpush<cr>
noremap <silent> <Leader>gl :Glog<cr>

"" UndoTree
noremap <silent> <c-u> :UndotreeToggle<cr>
let g:undotree_WindowLayout = 3
"let g:undotree_ShortIndicators = 1
"let g:undotree_SetFocusWhenToggle = 1

"" Denite
noremap <silent> <Leader>db :Denite buffer<cr>
noremap <silent> <Leader>df :Denite file_rec<cr>
noremap <silent> <Leader>dl :Denite line<cr>
noremap <silent> <Leader>dc :Denite command_history<cr>

"" cppman
autocmd FileType cpp set keywordprg=cppman

"" vebugger
let g:vebugger_leader='v'

"" ScreenShot
let ScreenShot = { 'Title':0, 'Credits':0, 'Icon':0 }

"------------------------------------------------------------
" Colors

"" Airline
"let g:airline_theme='dark'
"let g:airline_theme='light'
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

"" Base color
" solarized
let g:solarized_italic=0
set background=dark
"set background=light
colorscheme solarized

"" Switch color schemes on the fly
"noremap <Leader>sl :AirlineTheme light<bar>:set background=light<cr>
"noremap <Leader>sd :AirlineTheme dark<bar>:set background=dark<cr>
noremap <Leader>sl :let g:airline_solarized_bg='light'<bar>:AirlineRefresh<bar>:set background=light<cr>
noremap <Leader>sd :let g:airline_solarized_bg='dark'<bar>:AirlineRefresh<bar>:set background=dark<cr>

"MiniBufExpl Colors
hi link MBENormal                   airline_b_inactive
hi link MBEChanged                  airline_b_inactive_bold
hi link MBEVisibleNormal            airline_tab
hi link MBEVisibleChanged           airline_tabmod_unsel
hi link MBEVisibleActiveNormal      airline_tabsel
hi link MBEVisibleActiveChanged     airline_tabmod

" Only highligtht line number
highlight clear CursorLine
                        highlight CursorLineNr term=bold ctermfg=11 ctermbg=233 gui=bold guifg=Yellow
autocmd InsertLeave *   highlight CursorLineNr term=bold ctermfg=11 ctermbg=233 gui=bold guifg=Yellow
autocmd InsertEnter *   highlight CursorLineNr ctermfg=17 ctermbg=45 guifg=#00005f guibg=#00dfff
