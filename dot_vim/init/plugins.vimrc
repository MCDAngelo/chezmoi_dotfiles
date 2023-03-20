let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:copilot_filetypes = {
            \ 'markdown': ['markdown', 'gfm', 'md', 'mkd', 'mkdn', 'mdwn', 'mdown', 'mdtxt', 'mdtext', 'mdx', 'mk', 'ron', 'textile', 'txt'],
            \ }
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
let g:nerdtree_vis_confirm_open = 0
let NERDTreeIgnore=['\.git$', 'egg-info', 'dist-info', '__editable__', '__pycache__']

" Set vim slime target to tmux send using C-c C-c (same thing twice)
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}


" airline settings
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
