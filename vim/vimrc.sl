"----------------------------------------------------------------------------------------------------------------------
"
" .vimrc
"
" Author: Daniel Macedo <admacedo@gmail.com>
"
" This file is a compilation of many different sources, or things I came to know over the years.
"   I usually didn't save proper credit, as this was for my personal use.
" So if you come across something you like, just take it and use it; if you want to give credit, try
"   searching google for the comment next to it. Odds are, I didn't write that, nor came up with it...
"
" Enjoy!
"
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Basic VIM environment {{{
"----------------------------------------------------------------------------------------------------------------------

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" Define $VIMHOME
if has('win32') || has ('win64')
     let $VIMHOME = $VIM."/vimfiles"
else
     let $VIMHOME = $HOME."/.vim"
endif

" Change the mapleader from \ to , {{{
let mapleader = ","
let maplocalleader = "\\"
" }}}


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Forget Pathogen, we're now going with Vundle {{{
"----------------------------------------------------------------------------------------------------------------------

filetype off

set rtp+=$VIMHOME/bundle/Vundle.vim
call vundle#begin()

" HELP!
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Vundle Bundle List & Configs {{{
"----------------------------------------------------------------------------------------------------------------------


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'chrisbra/NrrwRgn'
Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Lokaltog/powerline'
Plugin 'skalnik/vim-vroom'
Plugin 'tpope/vim-fugitive'

" vim-scripts repos
Plugin 'FuzzyFinder'
Plugin 'L9'

" non github repos
Plugin 'git://git.wincent.com/command-t.git'

call vundle#end()
filetype plugin indent on


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Backups & undo {{{
"----------------------------------------------------------------------------------------------------------------------

if v:version >= 730
	set undofile			" keep a persistent backup file
	set undodir=$VIMHOME/undo
endif

set undoreload=10000
set nobackup				" do not keep a backup file, use versions instead
set undolevels=1000			" use many muchos levels of undo
set noswapfile				" do not write annoying intermediate swap files,
set directory=$VIMHOME/tmp	" store swap files in one of these directories (in case swapfile is ever turned on)


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Use UTF-8 encoding {{{
"----------------------------------------------------------------------------------------------------------------------

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun!ViewUTF8()
	set encoding=utf-8
	set termencoding=big5
endfun

fun!UTF8()
	set encoding=utf-8
	set termencoding=big5
	set fileencoding=utf-8
	set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun!Big5()
	set encoding=big5
	set fileencoding=big5
endfun


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Set Global Stuff {{{
"----------------------------------------------------------------------------------------------------------------------

set wrapscan					" set the search scan to wrap lines
set shellslash					" set the forward slash to be the slash of note.  Backslashes suck
set ch=3						" Make command line three lines high
set visualbell 					" set visual bell -- i hate that damned beeping
set backspace=2					" Allow backspacing over indent, eol, and the start of an insert
set cpoptions+=ces$				" Make the 'cw' and like commands put a $ at the end
set laststatus=2				" tell VIM to always put a status line in, even if there is only one window
set lazyredraw					" Don't update the display while executing macros
set showmode					" Show the current mode
set mousehide					" Hide the mouse pointer while typing
set virtualedit=all				" My cursor can go anywhere!
"Disable since this breaks NeoVIM
"set key=						" Disable encryption (:X)
set complete=.,w,b,t			" Same as default except that I remove the 'u' option
set showfulltag					" When completing by tag, show the whole tag, not just the function name
set fillchars=""				" get rid of the silly characters in window separators
set diffopt+=iwhite				" Add ignorance of whitespace to diff
set diffopt+=filler				" Add vertical spaces to keep right and left aligned
"set guioptions=ac				" set the gui options the way I like
set synmaxcol=2048				" Syntax coloring lines that are too long just slows down the world
set ttyfast						" Fast terminal connection

set bs=2						" allow backspacing over everything in insert mode
set history=1000				" keep 1000 lines of command line history
set clipboard=unnamed			" yank to the system register (*) by default
set showmatch					" Cursor shows matching ) and }
set matchtime=3					" Tenths of seconds to showmatch
set wildchar=<TAB>				" start wild expansion in the command line using <TAB>
set switchbuf=useopen			" reveal already opened files from quickfix window instead of opening new buffers
set title						" change the terminal's title
set nomodeline					" disable mode lines (security measure)
set cursorline					" underline the current line, for quick orientation
set matchpairs+=<:>				" Show xHTML/XML match pairs as well
set ruler						" show the cursor position all the time
set showcmd						" display incomplete commands
set numberwidth=5				" Line number column size, since files are usually big
set nostartofline				" Avoid having the cursor on the start of tabbed line
set autoindent					" always set autoindenting on
set smartindent					" use smart indent if there is no indent file
set copyindent					" copy the previous indentation on autoindenting
set ttimeout
set notimeout
set nottimeout

set formatoptions=
set formatoptions+=c			" Format comments
set formatoptions+=r			" Continue comments by default
set formatoptions+=o			" Make comment when using o or O from comment line
set formatoptions+=q			" Format comments with gq
set formatoptions+=n			" Recognize numbered lists
set formatoptions+=2			" Use indent from 2nd line of a paragraph
set formatoptions+=l			" Don't break lines that are already long
set formatoptions+=1			" Break before 1-letter words

set gdefault					" By default add g flag to search/replace. Add g to toggle.

set nojoinspaces				" Only insert single space after a '.', '?' and '!' with a join command.


" Line numbers & relative numbering
set relativenumber						" Start in relative numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

" Swap to line numbers on focus lost
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Always show relative numbering in normal mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber


" Wildmenu completion {{{
"
set wildmenu					" Make the command-line completion better
set wildmode=list:longest

" Ignore these filenames during enhanced command line completion.
set wildignore+=.hg,.git,.svn						" Version control
set wildignore+=*.aux,*.out,*.toc					" LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg		" binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest	" compiled object files
set wildignore+=*.sw?								" Vim swap files
set wildignore+=*.min.js,*/log/*,*/tmp/*			" Web devs


" Splits
set splitbelow
set splitright
set winminheight=1				"Allow splits to be reduced to a single line.

" }}}


" tabs, spaces, wrapping {{{

set tabstop=4					" Tabstops are 4 spaces
set shiftwidth=4
set softtabstop=4
set noexpandtab					" I like my tabs, use them!
set nowrap						" don't wrap text
set linebreak					" don't wrap textin the middle of a word
set textwidth=120				" This isn't the '90s any more! Set the textwidth to be 120 chars
set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
"             | | | | | | | | |
"             | | | | | | | | +-- "]" Insert and Replace
"             | | | | | | | +-- "[" Insert and Replace
"             | | | | | | +-- "~" Normal
"             | | | | | +-- <Right> Normal and Visual
"             | | | | +-- <Left> Normal and Visual
"             | | | +-- "l" Normal and Visual (not recommended)
"             | | +-- "h" Normal and Visual (not recommended)
"             | +-- <Space> Normal and Visual
"             +-- <BS> Normal and Visual

" show a line at column 120
if exists("&colorcolumn")
  set colorcolumn=120
endif


" }}}


" Reading/Writing
set noautowrite					" Never write a file unless I request it.
set noautowriteall				" NEVER.
set noautoread					" Don't automatically re-read changed files.
set modeline					" Allow vim options to be embedded in files;
set modelines=5					" they must be within the first or last 5 lines.
set ffs=unix,dos,mac			" Try recognizing dos, unix, and mac line endings.

" Searching, novement and patters {{{

set ignorecase					" Default to using case insensitive searches,
set smartcase					" unless uppercase letters are used in the regex.
set smarttab					" Handle tabs more intelligently
set hlsearch					" Highlight searches by default.
set incsearch					" Incrementally search while typing a /regex
set magic						" Enable extended regexes

" }}}


" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom, as well as 3 from sides
set scrolloff=8
set sidescrolloff=3
set sidescroll=1

" don't outdent hashes
inoremap # #

" These things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" This is the timeout used while waiting for user input on a multi-keyed macro
" or while just sitting and waiting for another key to be pressed measured
" in milliseconds.
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" I don't like it when the matching parens are automatically highlighted
"let loaded_matchparen = 1
" Actually, just set some proper colors
hi MatchParen ctermbg=blue guibg=lightblue

" Switch on syntax highlighting.
syntax on


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Folds {{{
"----------------------------------------------------------------------------------------------------------------------

set foldenable
" set foldlevelstart=3			" Sets foldlevel when editing a new buffer
set foldmethod=syntax			" Markers are used for specific folds
set foldlevel=2					" Don't fold everything by default
set foldminlines=0				" Allow folding single lines
set foldnestmax=3				" Set max fold nesting level

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo


" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,zz to "focus" the current fold.
nnoremap <leader>zz zMzvzz

" Use ,f(o|c) to open/close all folds
nnoremap <leader>zo zR
nnoremap <leader>zc zM

function!MyFoldText() " {{{
	let line = getline(v:foldstart)

	let nucolwidth = &fdc + &number * &numberwidth
	let windowwidth = winwidth(0) - nucolwidth - 3
	let foldedlinecount = v:foldend - v:foldstart

	" expand tabs into spaces
	let onetab = strpart('          ', 0, &tabstop)
	let line = substitute(line, '\t', onetab, 'g')

	" windowwidth
	let line = strpart(line, 0, 115 - 2 -len(foldedlinecount))
	let fillcharcount = 115 - len(line) - len(foldedlinecount)
	return line . ' …' . repeat(" ", fillcharcount) . foldedlinecount . ' …' . ' '
endfunction
set foldtext=MyFoldText()
" }}}

" Save and restore folds
"au BufWinLeave * silent! mkview
"au BufWinEnter * silent! loadview


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" HEX mode {{{
"----------------------------------------------------------------------------------------------------------------------

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function! ToggleHex()
	" hex mode should be considered a read-only operation
	" save values for modified and read-only for restoration later,
	" and clear the read-only flag for now
	let l:modified=&mod
	let l:oldreadonly=&readonly
	let &readonly=0
	let l:oldmodifiable=&modifiable
	let &modifiable=1
	if !exists("b:editHex") || !b:editHex
		" save old options
		let b:oldft=&ft
		let b:oldbin=&bin
		" set new options
		setlocal binary " make sure it overrides any textwidth, etc.
		let &ft="xxd"
		" set status
		let b:editHex=1
		" switch to hex editor
		%!xxd
	else
		" restore old options
		let &ft=b:oldft
		if !b:oldbin
		  setlocal nobinary
		endif
		" set status
		let b:editHex=0
		" return to normal editing
		%!xxd -r
	endif
	" restore values for modified and read only state
	let &mod=l:modified
	let &readonly=l:oldreadonly
	let &modifiable=l:oldmodifiable
endfunction


" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
	" vim -b : edit binary using xxd-format!
	augroup Binary
	au!

	" set binary option for all binary files before reading them
	au BufReadPre *.bin,*.hex setlocal binary

	" if on a fresh read the buffer variable is already set, it's wrong
	au BufReadPost *
		\ if exists('b:editHex') && b:editHex |
		\   let b:editHex = 0 |
		\ endif

	" convert to hex on startup for binary files automatically
	au BufReadPost *
		\ if &binary | Hexmode | endif

	" When the text is freed, the next time the buffer is made active it will
	" re-read the text and thus not match the correct mode, we will need to
	" convert it again if the buffer is again loaded.
	au BufUnload *
		\ if getbufvar(expand("<afile>"), 'editHex') == 1 |
		\   call setbufvar(expand("<afile>"), 'editHex', 0) |
		\ endif

	" before writing a file when editing in hex mode, convert back to non-hex
	au BufWritePre *
		\ if exists("b:editHex") && b:editHex && &binary |
		\  let oldro=&ro | let &ro=0 |
		\  let oldma=&ma | let &ma=1 |
		\  silent exe "%!xxd -r" |
		\  let &ma=oldma | let &ro=oldro |
		\  unlet oldma | unlet oldro |
		\ endif

	" after writing a binary file, if we're in hex mode, restore hex mode
	au BufWritePost *
		\ if exists("b:editHex") && b:editHex && &binary |
		\  let oldro=&ro | let &ro=0 |
		\  let oldma=&ma | let &ma=1 |
		\  silent exe "%!xxd" |
		\  exe "set nomod" |
		\  let &ma=oldma | let &ro=oldro |
		\  unlet oldma | unlet oldro |
		\ endif

	augroup END
endif


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Status line by Dani {{{
"----------------------------------------------------------------------------------------------------------------------

augroup ft_statuslinecolor
	au!
	au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
	au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

set stl=%<%f\ \ \ \ 			" /dir/filename.txt

set stl+=%-20((%03l/%L,\ %02c%03V)%)	" (line/total lines, column)
set stl+=\ %p%%				" file%

set stl+=\ %=  				" Right align.

set stl+=(
set stl+=%{&ff}				" format (unix/DOS)
set stl+=/
set stl+=%{strlen(&fenc)?&fenc:&enc}	" Encoding (utf-8)
set stl+=/
set stl+=%{&ft}                        " Type (python).
set stl+=)

" MOD+, RO-, Buffer #, TYPE ... Character under cursor [byte,hex]
set stl+=\ %1*%M%*\#%n%R\ %Y\ %-15([%b,0x%B]%)

set ls=2					" allways show status line
set vb t_vb=				" Disable all bells.  I hate ringing/flashing.
set confirm					" Y-N-C prompt if closing with unsaved changes.
set showcmd					" Show incomplete normal mode commands as I type.
set report=0				" : commands always print changed line count.
set shortmess+=a			" Use [+]/[RO]/[w] for modified/readonly/written.
set shortmess+=I			" Don't show intro message when starting VIM
set ruler					" Show some info, even without statuslines.
set laststatus=2			" Always show statusline, even if only 1 window.


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Finish up on options (needs review) {{{
"----------------------------------------------------------------------------------------------------------------------

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=120

	" When editing a file, always jump to the last known cursor position.
	" Don't do it when the position is invalid or when inside an event handler
	" (happens when dropping a file on gvim).
	" Also don't do it when the mark is in the first line, that is the default
	" position when opening a file.
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
	augroup END

endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Initial path seeding
set path=
set path+=/usr/local/include/**
set path+=/usr/include/**
set path+=~/code/**
set path+=~/work/**

" Set the tags files to be the following
set tags=./tags,tags

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" displays tabs with :set list & displays when a line has trailing spaces or runs off-screen
set nolist
set listchars=tab:▸\ ,trail:·,eol:¶,precedes:«,extends:»
set fcs=fold:-
nnoremap <silent> <leader>sh :set nolist!<CR>


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Key remaps {{{
"----------------------------------------------------------------------------------------------------------------------


" Destroy infuriating keys {{{

" Fuck you, help key.
noremap  <F1> <ESC>
inoremap <F1> <ESC>

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
inoremap # X<BS>#

" }}}

" Less chording
nnoremap ; :

" Cmdheight switching always with breathing room...
nnoremap <leader>1 :set cmdheight=3<cr>
nnoremap <leader>2 :set cmdheight=2<cr>

" Embrace vim, use those damn hjkl keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Marks and Quotes (can't find the best way to do this!)
" noremap « `
"noremap ` <C-^>
nnoremap ' `

:vnoremap > >gv
:vnoremap < <gv

" Alternative using Tab/Shift-Tab (for gvim).
:vnoremap <Tab> >gv
:vnoremap <S-Tab> <gv

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+v

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
inoremap jj <Esc>
inoremap jk <Esc>

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Jump to matching pairs easily, with Tab
nnoremap \ %
vnoremap \ %

" Folding
nnoremap <Space> za
vnoremap <Space> za

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" The following beast is something i didn't write... it will return the
" syntax highlighting group that the current "thing" under the cursor
" belongs to -- very useful for figuring out what to change as far as
" syntax highlighting goes.
nmap <silent> <C-F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
	 \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name")
	 \ . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
	 \ . ">"<CR>

" Run the command that was just yanked
nmap <silent> <leader>rc :@"<cr>

" Maps to make handling windows a bit easier
" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Faster split resizing (+,-)
if bufwinnr(1)
	map + <C-W>+
	map - <C-W>-
endif

" overwritten with quick buffer list
" noremap <silent> <leader>l :wincmd l<CR>
noremap <silent> <leader>sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> <leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <leader>cl :wincmd l<CR>:close<CR>
noremap <silent> <leader>cc :close<CR>
noremap <silent> <leader>co :copen<CR>
noremap <silent> <leader>cw :cclose<CR>
noremap <silent> <leader>ml <C-W>L
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J
noremap <silent> <C-7> <C-W><
noremap <silent> <C-8> <C-W>-
noremap <silent> <C-9> <C-W>+
noremap <silent> <C-0> <C-W>>

" Map Alt-[h,j,k,l] to resizing a window split
map <silent> <A-h> <C-w><
map <silent> <A-j> <C-W>-
map <silent> <A-k> <C-W>+
map <silent> <A-l> <C-w>>
" Map Alt-[s.v] to horizontal and vertical split respectively
map <silent> <A-s> :split<CR>
map <silent> <A-v> :vsplit<CR>
" Map Alt-[n,p] for moving next and previous window respectively
map <silent> <A-n> <C-w><C-w>
map <silent> <A-p> <C-w><S-w>

" Sudo write (,W)
noremap <leader>W :w !sudo tee %<CR>

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Map CTRL-E to do what ',' used to do
nnoremap <c-e> ,
vnoremap <c-e> ,

" Buffer commands
noremap <silent> <leader>bd :bd<CR>

" Edit the ~ file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Make horizontal scrolling easier
"nmap <silent> <C-o> 10zl
"nmap <silent> <C-i> 10zh

" Indent/unident block (,]) (,[)
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

" Insert newline
map <leader><Enter> o<ESC>


" }}}
"----------------------------------------------------------------------------------------------------------------------

"----------------------------------------------------------------------------------------------------------------------
" Other key maps {{{
"----------------------------------------------------------------------------------------------------------------------

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>


" Multipurpose Tab Key
" {{{
" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
" }}}

" Rename Current File
" {{{
function! RenameFile()
	let old_name = expand('%')
	let new_name = input('New file name: ', expand('%'), 'file')
	if new_name != '' && new_name != old_name
		exec ':saveas ' . new_name
		exec ':silent !rm ' . old_name
		redraw!
	endif
endfunction
map <leader>n :call RenameFile()<cr>
" }}}

" Promote Variable to Rspec let
" {{{
""""" function! PromoteToLet()
""""" 	:normal! dd
""""" 	" :exec '?^\s*it\>'
""""" 	:normal! P
""""" 	:.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
""""" 	:normal ==
""""" endfunction
""""" :command! PromoteToLet :call PromoteToLet()
""""" :map <leader>p :PromoteToLet<cr>
" }}}

" Maps to jump to specific command-t targets and files
" {{{
""""" map <leader>gr :topleft :split config/routes.rb<cr>
""""" function! ShowRoutes()
""""" 	" Requires 'scratch' plugin
""""" 	:topleft 100 :split __Routes__
""""" 	" Make sure Vim doesn't write __Routes__ as a file
""""" 	:set buftype=nofile
""""" 	" Delete everything
""""" 	:normal 1GdG
""""" 	" Put routes output in buffer
""""" 	:0r! rake -s routes
""""" 	" Size window to number of lines (1 plus rake output length)
""""" 	:exec ":normal " . line("$") . "_ "
""""" 	" Move cursor to bottom
""""" 	:normal 1GG
""""" 	" Delete empty trailing line
""""" 	:normal dd
""""" endfunction
""""" map <leader>gR :call ShowRoutes()<cr>
""""" map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
""""" map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
""""" map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
""""" map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
""""" map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
""""" map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
""""" map <leader>gs :CommandTFlush<cr>\|:CommandT public/stylesheets/sass<cr>
""""" map <leader>gf :CommandTFlush<cr>\|:CommandT features<cr>
""""" map <leader>gg :topleft 100 :split Gemfile<cr>
""""" map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
"map <leader>gc :CommandTFlush<cr>\|:CommandT core/application/classes/controllers<cr>
"map <leader>gm :CommandTFlush<cr>\|:CommandT core/application/classes/models<cr>
"map <leader>gv :CommandTFlush<cr>\|:CommandT core/application/views<cr>
"map <c-p> :CommandTFlush<cr>\|:CommandT<cr>
"map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
" }}}


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" OpenChangedFiles COMMAND {{{
" Open a split for each dirty file in git
"----------------------------------------------------------------------------------------------------------------------

function! OpenChangedFiles()
	only " Close all windows, unless they're modified
	let status = system('git status -s | grep "^ \?\(M\|A\)" | cut -d " " -f 3')
	let filenames = split(status, "\n")
	exec "edit " . filenames[0]
	for filename in filenames[1:]
		exec "sp " . filename
	endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Utilities & helpers append {{{
"----------------------------------------------------------------------------------------------------------------------


" C-F5 removes trailing whitespaces everywhere ("force refresh"! :)
nnoremap <silent> <C-F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Delete all buffers
nmap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<cr>

" Quickly close the current window
nnoremap <leader>q :q<CR>

" set text wrapping toggles
nmap <silent> <leader>w :set invwrap<CR>:set wrap?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
nmap <silent> <leader>. :lcd %:h<CR>
" Use .. for the parent dir
nmap <silent> <leader>.. :lcd %:h<CR>:chdir ..<CR>
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Turn off that stupid highlight search
nmap <silent> <leader>n :set invhls<CR>:set hls?<CR>

" Clear last search (,cs)
map <silent> <leader>cs <Esc>:let @/ = ""<CR>

" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" put the vim directives for my file editing settings in
nmap <silent> <leader>vi
	\ ovim:set ts=4 sts=4 sw=4:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|set nohls<cr>

" Highlight all instances of the current word under the cursor
nmap <silent> ^ :setl hls<CR>:let @/="<C-r><C-w>"<CR>

" Search the current file for what's currently in the search
" register and display matches
nmap <silent> <leader>gs
	\ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the word under the cursor and display matches
nmap <silent> <leader>gw
	\ :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Search the current file for the WORD under the cursor and display matches
nmap <silent> <leader>gW
	\ :vimgrep /<C-r><C-a>/ %<CR>:ccl<CR>:cwin<CR><C-W>J:set nohls<CR>

" Backspace deletes in visual mode
vmap <backspace> x

" Quick Open/Close
nnoremap <leader>x :bw<CR>
nnoremap <leader>e :e .<CR>

" List Buffers and quick swap
nnoremap <leader>L :ls!<CR>
nnoremap <leader>3 :b#<CR>

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" CTRL-Z is Undo; not in cmdline though
"noremap <C-Z> u
"inoremap <C-Z> <C-O>u

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-c> "+y
vnoremap <C-Insert> "+y

" SHIFT-Insert is Paste
map <S-Insert> "+gP
cmap <S-Insert> <C-R>+

" Insert signature
imap <leader>dm Daniel Macedo <admacedo@gmail.com>

" Arrows are pretty
" imap >> →
" imap << ←
" imap ^^ ↑
" imap VV ↓


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Fix constant spelling mistakes {{{
"----------------------------------------------------------------------------------------------------------------------

iab teh       the
iab Teh       The
iab taht      that
iab Taht      That
iab alos      also
iab Alos      Also
iab aslo      also
iab Aslo      Also
iab becuase   because
iab Becuase   Because
iab bianry    binary
iab Bianry    Binary
iab bianries  binaries
iab Bianries  Binaries
iab charcter  character
iab Charcter  Character
iab charcters characters
iab Charcters Characters
iab exmaple   example
iab Exmaple   Example
iab exmaples  examples
iab Exmaples  Examples
iab shoudl    should
iab Shoudl    Should
iab seperate  separate
iab Seperate  Separate
iab fone      phone
iab Fone      Phone


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Helper functions {{{
"----------------------------------------------------------------------------------------------------------------------


" Strip all trailing whitespace from a file, using ,w
" nnoremap <leader>ss :%s/\s\+$//<CR>:let @/=''<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace ()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace ()<CR>


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Various filetype-specific stuff {{{
"----------------------------------------------------------------------------------------------------------------------

" PHP {{{
" }}}

" CSS and LessCSS {{{
augroup ft_css
	au!

	au BufNewFile,BufRead *.less setlocal filetype=less

	au Filetype less,css setlocal foldmethod=marker
	au Filetype less,css setlocal foldmarker={,}
	au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
	au Filetype less,css setlocal iskeyword+=-

	" Use <leader>S to sort properties.  Turns this:
	"
	"     p {
	"         width: 200px;
	"         height: 100px;
	"         background: red;
	"
	"         ...
	"     }
	"
	" into this:

	"     p {
	"         background: red;
	"         height: 100px;
	"         width: 200px;
	"
	"         ...
	"     }
	au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

	" Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
	" positioned inside of them AND the following code doesn't get unfolded.
	au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END
" }}}

" Javascript {{{
augroup ft_javascript
	au!
	au FileType javascript setlocal foldmethod=marker
	au FileType javascript setlocal foldmarker={,}
augroup END
" }}}

" Puppet {{{
augroup ft_puppet
	au!

	au Filetype puppet setlocal foldmethod=marker
	au Filetype puppet setlocal foldmarker={,}
augroup END
" }}}

" Python {{{
augroup ft_python
	set tabstop=2					" Tabstops are 2 spaces
	set shiftwidth=2
	set softtabstop=2
	set expandtab					" Use spaces for indentation

	au!

	au Filetype python noremap  <buffer> <localleader>rr :RopeRename<CR>
	au Filetype python vnoremap <buffer> <localleader>rm :RopeExtractMethod<CR>
	au Filetype python noremap  <buffer> <localleader>ri :RopeOrganizeImports<CR>

	au FileType python setlocal omnifunc=pythoncomplete#Complete
	au FileType python setlocal define=^\s*\\(def\\\\|class\\)
""	au FileType python compiler nose
	au FileType man nnoremap <buffer> <cr> :q<cr>
augroup END
" }}}

" Ruby {{{
augroup ft_ruby
	au!
	au Filetype ruby setlocal foldmethod=syntax
augroup END
" }}}

" Vim {{{
augroup ft_vim
	au!

	au FileType vim setlocal foldmethod=marker
	au FileType help setlocal textwidth=78
	au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END
" }}}

" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Ruby {{{
"----------------------------------------------------------------------------------------------------------------------


" Ruby Running Tests {{{
function! RunTests(filename)
	" Write the file and run tests for the given filename
	:w
	:silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
	:silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
	:silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
	:silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
	:silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
	:silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
	if match(a:filename, '\.feature$') != -1
		exec ":!script/features " . a:filename
	else
		if filereadable("script/test")
			exec ":!script/test " . a:filename
		elseif filereadable("Gemfile")
			exec ":!bundle exec rspec --color " . a:filename
		else
			exec ":!rspec --color " . a:filename
		end
	end
endfunction

function! SetTestFile()
	" Set the spec file that tests will be run for.
	let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
	if a:0
		let command_suffix = a:1
	else
		let command_suffix = ""
	endif

	" Run the tests for the previously-marked file.
	let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
	if in_test_file
		call SetTestFile()
	elseif !exists("t:grb_test_file")
		return
	end
	call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
	let spec_line_number = line('.')
	call RunTestFile(":" . spec_line_number . " -b")
endfunction

"map <leader>t :call RunTestFile()<cr>
"map <leader>T :call RunNearestTest()<cr>
"map <leader>a :call RunTests('')<cr>
"map <leader>c :w\|:!script/features<cr>
"map <leader>w :w\|:!script/features --profile wip<cr>
" }}}


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" PHP {{{
"----------------------------------------------------------------------------------------------------------------------


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Plugin Settings {{{
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" FuzzyFinder Settings {{{
"----------------------------------------------------------------------------------------------------------------------

"nmap <leader>fb :FufBuffer<CR>
"nmap <leader>ff :FufFile<CR>
"nmap <leader>fj :FufJumpList<CR>
"nmap <leader>fl :FufLine<CR>
"nmap <leader>ft :FufTag<CR>


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" BufExplorer Settings {{{
"----------------------------------------------------------------------------------------------------------------------
" Keymaps reverted to default!


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" NERD Tree Plugin Settings {{{
"----------------------------------------------------------------------------------------------------------------------
" Toggle the NERD Tree on an off with F7
"nmap <F7> :NERDTreeToggle<CR>

" Close the NERD Tree with Shift-F7
"nmap <S-F7> :NERDTreeClose<CR>

" Store the bookmarks file in perforce
"let NERDTreeBookmarksFile="$VIMHOME/NERDTreeBookmarks"

" Show the bookmarks table on startup
"let NERDTreeShowBookmarks=1

" Don't display these kinds of files
"let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
"            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
"            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
"            \ '\.intermediate\.manifest$', '^mt.dep$' ]


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Taglist Plugin {{{
"----------------------------------------------------------------------------------------------------------------------
" The switch of the Taglist Plutin
"nmap <silent> <F8> :TlistToggle<CR>

" Automatically gain focus on the taglist window
"let Tlist_GainFocus_On_ToggleOpen = 1

" Automatically update when a file is edited
"let Tlist_Auto_Update = 1

" If only the taglist window is open, we can close vim
"let Tlist_Exit_OnlyWindow = 1


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Project Plugin {{{
"----------------------------------------------------------------------------------------------------------------------

" Configure project plugin
"nmap <silent> <Leader>P :Project<CR>


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" EasyMotion {{{
"----------------------------------------------------------------------------------------------------------------------

" Configure easymotion plugin
let g:EasyMotion_leader_key = '<Leader>'

" }}}
"----------------------------------------------------------------------------------------------------------------------


" }}}
"----------------------------------------------------------------------------------------------------------------------

"----------------------------------------------------------------------------------------------------------------------
" Set up the window colors and size {{{
"----------------------------------------------------------------------------------------------------------------------

if has("gui_running")
	"set showtabline					" Always show the tab bar
	set guifont="Fira Code":h12
	colorscheme desert
	if !exists("g:vimrcloaded")
		winpos 0 0
		" Maximize vim
		set lines=999 columns=999
		if !&diff
			winsize 227 90
		endif
		let g:vimrcloaded = 1
	endif
	" This is console Vim.
	if exists("+lines")
		set lines=50
	endif
	if exists("+columns")
		set columns=100
	endif
endif

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Fira\ Code\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


"if has("gui_running")
"	" GUI is running or is about to start.
"	" Maximize gvim window.
"	set lines=999 columns=999
"else
"	" This is console Vim.
"	if exists("+lines")
"		set lines=50
"	endif
"	if exists("+columns")
"		set columns=100
"	endif
"endif

set background=dark

colorscheme solarized

" Set light scheme on GUI and dark on console
if has('gui_running')
	"set background=light
	set background=dark
	call togglebg#map("<F12>")
else
	let g:solarized_termcolors=256
	set background=dark
endif


" }}}
"----------------------------------------------------------------------------------------------------------------------


"----------------------------------------------------------------------------------------------------------------------
" Custom env for this machine {{{
"----------------------------------------------------------------------------------------------------------------------

syntax enable

":chdir ~

"EOF


" }}}
"----------------------------------------------------------------------------------------------------------------------
