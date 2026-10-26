return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  ft = { "rust" },
  cmd = { "RustLsp" },

  config = function()
    -- Ejecutar comandos de Rust en la terminal habitual de NvChad.
    local function nvchad_rust_executor()
      return {
        execute_command = function(command, args, cwd, opts)
          opts = opts or {}

          local parts = {}

          -- Go to the project directory.
          if cwd then
            table.insert(parts, "cd " .. vim.fn.shellescape(cwd))
          end

          -- Set environment variables.
          for key, value in pairs(opts.env or {}) do
            assert(key:match "^[%a_][%w_]*$", "Invalid environment variable name: " .. key)

            table.insert(parts, "export " .. key .. "=" .. vim.fn.shellescape(tostring(value)))
          end

          -- Build the command with its arguments.
          local argv = { vim.fn.shellescape(command) }

          for _, arg in ipairs(args or {}) do
            table.insert(argv, vim.fn.shellescape(tostring(arg)))
          end

          table.insert(parts, table.concat(argv, " "))

          -- Reuse the terminal of Alt + H.
          require("nvchad.term").runner {
            pos = "sp", -- "float" or "sp"
            id = "htoggleTerm",
            cmd = table.concat(parts, " && "),
            clear_cmd = "clear; ",
          }
        end,
      }
    end

    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          -- Tree-sitter controls rust colors.
          client.server_capabilities.semanticTokensProvider = nil
        end,
      },

      tools = {
        executor = nvchad_rust_executor(),
        test_executor = nvchad_rust_executor(),
        crate_test_executor = nvchad_rust_executor(),
      },
    }
  end,
}
