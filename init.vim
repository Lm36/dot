call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/toggleterm.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'pseewald/vim-anyfold'
Plug 'arecarn/vim-fold-cycle'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'Mofiqul/vscode.nvim'
call plug#end()

lua require("nvim-autopairs").setup {}
lua require("toggleterm").setup()

colorscheme vscode
autocmd BufRead,BufNewFile *.asm colorscheme gruvbox

set tabstop=4
set shiftwidth=4
set expandtab

hi LineNr guifg=white
set number
set relativenumber

let g:startify_custom_header = [
    \' /$$   /$$ /$$$$$$$$  /$$$$$$  /$$    /$$ /$$$$$$ /$$      /$$',
    \'| $$$ | $$| $$_____/ /$$__  $$| $$   | $$|_  $$_/| $$$    /$$$',
    \'| $$$$| $$| $$      | $$  \ $$| $$   | $$  | $$  | $$$$  /$$$$',
    \'| $$ $$ $$| $$$$$   | $$  | $$|  $$ / $$/  | $$  | $$ $$/$$ $$',
    \'| $$  $$$$| $$__/   | $$  | $$ \  $$ $$/   | $$  | $$  $$$| $$',
    \'| $$\  $$$| $$      | $$  | $$  \  $$$/    | $$  | $$\  $ | $$',
    \'| $$ \  $$| $$$$$$$$|  $$$$$$/   \  $/    /$$$$$$| $$ \/  | $$',
    \'|__/  \__/|________/ \______/     \_/    |______/|__/     |__/',
    \ ]

" Remaps
let mapleader = "\<Space>"
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>ff :Telescope find_files previewer=true<CR>
nnoremap <leader>fg :Telescope live_grep previewer=true<CR>
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
nnoremap <C-x> :ToggleTerm direction=float<CR>
nnoremap <C-l> :noh<CR>
tnoremap <Esc> <C-\><C-n> 
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" NERDTree
map <C-t> :NERDTreeToggle<CR>
map <C-e> :NERDTreeCWD<CR>

lua << EOF
require'nvim-treesitter.install'.prefer_git = true
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"python", "c", "go", "asm", "cpp", "json", "html"},
    highlight = {
        enable = true,
    },
}
EOF
