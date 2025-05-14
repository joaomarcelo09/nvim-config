source ~/.config/nvim/settings.vim
source ~/.config/nvim/vim-plug/plugins.vim

" Theme
source ~/.config/nvim/lua/plugins/theme-config.lua

set wildmenu
set wildmode=longest:full,full

" NERDTree config
source ~/.config/nvim/lua/plugins/nerdtree-config.lua

" Mantém o NERDTree aberto ao abrir arquivos
"autocmd VimEnter * NERDTree | wincmd p
"autocmd BufEnter * if !&diff | silent! NERDTreeMirror | endif
"nnoremap , :NERDTreeToggle<CR>

" Telescope config
source ~/.config/nvim/lua/plugins/telescope-config.lua

" Carregar configuração do cmp
source ~/.config/nvim/lua/plugins/cmp-config.lua
source ~/.config/nvim/lua/plugins/colorful-menu-config.lua
"source ~/.config/nvim/lua/plugins/blink-config.lua

" Mason Config
source ~/.config/nvim/lua/plugins/mason-config.lua

" Appearance
source ~/.config/nvim/lua/plugins/lua-line-config.lua
source ~/.config/nvim/lua/plugins/bufferline-config.lua

" Language servers

source ~/.config/nvim/lua/plugins/lsp/html-lsp.lua
source ~/.config/nvim/lua/plugins/lsp/typescript-lsp.lua
source ~/.config/nvim/lua/plugins/lsp/java-lsp.lua
source ~/.config/nvim/lua/plugins/lsp/python-lsp.lua

" Debugger
source ~/.config/nvim/plug-config/dap-config.lua

"Sintax
source ~/.config/nvim/lua/plugins/threesitter.lua

" Load all shortcuts
source ~/.config/nvim/plug-config/shortcuts-config.lua

