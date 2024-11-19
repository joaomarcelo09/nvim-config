source ~/.config/nvim/settings.vim
source ~/.config/nvim/vim-plug/plugins.vim

" Mantém o NERDTree aberto ao abrir arquivos
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if !&diff | silent! NERDTreeMirror | endif
nnoremap , :NERDTreeToggle<CR>


" Carregar configuração do cmp
source ~/.config/nvim/lua/plugins/cmp-config.lua

" Carregar configuração do LSP
source ~/.config/nvim/plug-config/lsp-config.vim

" Language servers

source ~/.config/nvim/lua/plugins/lsp/typescript-lsp.lua
" source ~/.config/nvim/lua/plugins/lsp/java-lsp.lua
source ~/.config/nvim/lua/plugins/lsp/python-lsp.lua

" Debugger
source ~/.config/nvim/plug-config/dap-config.lua

"Sintax
source ~/.config/nvim/lua/plugins/threesitter.lua
