require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
        ["af"] = { query = "@parameter.outer", desc = "Select outer part of a function region" },
        ["if"] = { query = "@parameter.outer", desc = "Select inner part of a fucntion region" },
        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional region" },
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },
        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop region" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  },
}
