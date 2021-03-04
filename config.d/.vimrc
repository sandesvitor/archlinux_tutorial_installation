" ############  BASIC SETUP  ############

set nocompatible
syntax enable
filetype plugin on
set number
set shiftwidth=4
set tabstop=4
set expandtab


" ############  FINDING FILES ############

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy!
" - :ls to show buffer && :b lets you autocomplete any open buffer


" ############  TAG JUMPING  #############
"  Search 'classes', 'objects' and 'functions', etc...
command! MakeTag !ctags -R .

" NOW WE CAN:
"  - Use ^] to jump to a tag under cursor
"  - Use g^] for ambiguous tags
"  - Use ^t to jump back up the tag stack


" ############  AUTOCOMPLETE  ############
" The godd stuff is documented in |ins-completion|
"
" " HIGHLIGHTS:
"  - ^x^n for JUST this file
"  - ^x^f for filenames (works with our path trick!)
"  - ^x^] for tags only
"  - ^n for anythong specified by the 'complete' option

"  NOW WE CAN: 
"  - Use ^n and ^p to go back and forth in the suggestion list
