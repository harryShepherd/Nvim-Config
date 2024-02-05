local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

local kmp = vim.kmp

-- Enable keybinds for available lsp server
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- keybinds
  kmp.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
  kmp.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  kmp.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  kmp.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  kmp.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  kmp.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  kmp.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  kmp.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  kmp.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  kmp.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)
end

-- Enables autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["clangd"].setup({           --| C & C++
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["jdtls"].setup({            --| Java
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["marksman"].setup({                   --| Marksman
  capabilities = capabilities,
  on_attach = on_attach,
})
