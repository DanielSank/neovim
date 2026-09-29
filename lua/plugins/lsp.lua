return {
  -- 1. LSP Server Management
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "pyright", "vtsls" },
    },
  },

  -- 2. Built-in LSP Configurations & Keybinds
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })

      -- Python
      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportUnusedImport = "warning",
                reportUnusedVariable = "warning",
              },
            },
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = true,
        float = { focusable = false, style = "minimal", border = "rounded", source = true, header = "", prefix = "" },
      })
      local grp = vim.api.nvim_create_augroup("UserLspConfig", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = grp,
        callback = function(ev)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")

          vim.api.nvim_clear_autocmds({ group = grp, event = "CursorHold", buffer = ev.buf })
          vim.api.nvim_create_autocmd("CursorHold", {
            group = grp, buffer = ev.buf,
            callback = function() vim.diagnostic.open_float(nil, { focus = false }) end,
          })
        end
      })
    end
  },

  -- 3. Autocompletion Engine (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
