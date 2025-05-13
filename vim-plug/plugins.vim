
" =============================================================================
"
filetype off

" Install the plugin manager if it doesn't exist
let s:plugin_manager=expand('~/.vim/autoload/plug.vim')
let s:plugin_url='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if empty(glob(s:plugin_manager))
  echom 'vim-plug not found. Installing...'
  if executable('curl')
    silent exec '!curl -fLo ' . s:plugin_manager . ' --create-dirs ' .
          \ s:plugin_url
  elseif executable('wget')
    call mkdir(fnamemodify(s:plugin_manager, ':h'), 'p')
    silent exec '!wget --force-directories --no-check-certificate -O ' .
          \ expand(s:plugin_manager) . ' ' . s:plugin_url
  else
    echom 'Could not download plugin manager. No plugins were installed.'
    finish
  endif
  augroup vimplug
    autocmd!
    autocmd VimEnter * PlugInstall
  augroup END
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    "Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'prisma/vim-prisma'

    " Nerd Font Icons (MUST HAVE for icons to appear)
    Plug 'ryanoasis/vim-devicons'

    " Mason and its lspconfig bridge
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'

    " Optional: DAP integration
    Plug 'jay-babu/mason-nvim-dap.nvim'

    " Java LS
    Plug 'mfussenegger/nvim-jdtls'

    " Debugger 
    Plug 'nvim-neotest/nvim-nio' 
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'

    " Dracula
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'folke/tokyonight.nvim'

    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    " Styled components
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

    " Lsp Config
    Plug 'neovim/nvim-lspconfig'

    " Configuração de Plugins relacionados ao CMP
  
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'saghen/blink.cmp'
    Plug 'xzbdmw/colorful-menu.nvim'

    " Airline vim
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "Git plugin
    Plug 'tpope/vim-fugitive'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'

    " Prettier for code
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

     " Used to shows icons on screen
    Plug 'nvim-tree/nvim-web-devicons'

    " Status bar
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
    Plug 'nvim-lualine/lualine.nvim'

    "Plugin for search engine inside nvim
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " Used to comment whe whole line or selected lines
    Plug 'preservim/nerdcommenter'
    
    " tmux 
    Plug 'christoomey/vim-tmux-navigator'

    " Viminspector to debug
    Plug 'puremourning/vimspector'

    Plug 'preservim/nerdtree'

call plug#end()


