return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- Desactivar UI de NvChad en VSCode
  {
    "NvChad/ui",
    enabled = not vim.g.vscode, -- Solo habilitar fuera de VSCode
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "monkoose/neocodeium",
    enabled = not vim.g.vscode, -- Disable in VSCode
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
    end,
  },
  {
  'leoluz/nvim-dap-go',
  dependencies = { 'mfussenegger/nvim-dap' },
  ft = "go",
  config = function()
    require("dap-go").setup()
  end
},
  { import = "nvchad.blink.lazyspec" },
-- Asegúrate de que también está el plugin base DAP



{
  "mfussenegger/nvim-dap",
  enabled = not vim.g.vscode,
  config = function()
    -- nvim-dap configuration
    local dap = require("dap")
    vim.keymap.set("n", "<leader>ld", dap.continue, { desc = "Debug: Continue" })
    vim.keymap.set("n", "<leader>lo", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<leader>li", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<leader>lO", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>lb", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
  end,
},
{
  'leoluz/nvim-dap-go',
  dependencies = { 'mfussenegger/nvim-dap' },
  ft = "go",
  config = function()
    require("dap-go").setup({
      -- delve configurations
      delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port.
        -- if you set a port in your debug configuration, its value will be
        -- assigned dynamically.
        port = "2345",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        -- avaliable ui interactive function to prompt for arguments get_arguments
        build_flags = {},
        -- whether the dlv process to be created detached or not. there is
        -- an issue on delve versions < 1.24.0 for Windows where this needs to be
        -- set to false, otherwise the dlv server creation will fail.
        -- avaliable ui interactive function to prompt for build flags: get_build_flags
        detached = vim.fn.has("win32") == 0,
        -- the current working directory to run dlv from, if other than
        -- the current working directory.
        cwd = nil,
      },
      -- options related to running closest test
      tests = {
        -- enables verbosity when running the test.
        verbose = false,
      },
    })
  end
},{
  'stevearc/conform.nvim',
  opts = {},
    }
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
