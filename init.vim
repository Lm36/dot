let g:startify_custom_header = [
    \' /$$   /$$ /$$    /$$ /$$$$$$ /$$      /$$',
    \'| $$$ | $$| $$   | $$|_  $$_/| $$$    /$$$',
    \'| $$$$| $$| $$   | $$  | $$  | $$$$  /$$$$',
    \'| $$ $$ $$|  $$ / $$/  | $$  | $$ $$/$$ $$',
    \'| $$  $$$$ \  $$ $$/   | $$  | $$  $$$| $$',
    \'| $$\  $$$  \  $$$/    | $$  | $$\  $ | $$',
    \'| $$ \  $$   \  $/    /$$$$$$| $$ \/  | $$',
    \'|__/  \__/    \_/    |______/|__/     |__/',
    \ ]

call plug#begin('~/.config/nvim/plugged')
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'akinsho/toggleterm.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'Mofiqul/vscode.nvim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
call plug#end()

set tabstop=4
set shiftwidth=4
set expandtab
set number
set relativenumber

hi LineNr guifg=white

colorscheme vscode

" Remaps
let mapleader = "\<Space>"
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <C-l> :noh<CR>
" ToggleTerm
nnoremap <C-x> :ToggleTerm direction=horizontal<CR>
tnoremap <Esc> <C-\><C-n> 
" Telescope 
nnoremap <leader>ff :Telescope find_files previewer=true<CR>
nnoremap <leader>lg :Telescope live_grep previewer=true<CR>
" Coc
nnoremap <silent> <leader>d <Plug>(coc-definition)
nnoremap <silent> <leader>r <Plug>(coc-references)
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" Nerd Tree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeCWD<CR>

" Lua
lua << EOF
require("nvim-autopairs").setup {}
require("toggleterm").setup()
require('nvim-treesitter.install').prefer_git = true
require('nvim-treesitter.configs').setup {
    ensure_installed = {"python", "c", "go", "json", "html"},
    highlight = {
        enable = true,
    },
}
EOF
