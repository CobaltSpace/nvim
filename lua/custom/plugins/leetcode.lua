return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    'nvim-telescope/telescope.nvim',
    -- "ibhagwan/fzf-lua",
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  lazy = 'leetcode.nvim' ~= vim.fn.argv(0, -1),
  cmd = 'Leet',
  opts = {
    -- configuration goes here
    image_support = true,
    lang = 'rust',
    injector = {
      ['rust'] = {
        before = { '#[allow(dead_code)]', 'fn main(){}', '#[allow(dead_code)]', 'struct Solution;' },
      }, ---@type table<lc.lang, lc.inject>
      ['cpp'] = {
        before = { '#include <bits/stdc++.h>', 'using namespace std;' },
        after = 'auto main() -> int {}',
      },
    },
    hooks = {
      ---@type fun(question: lc.ui.Question)[]
      ['question_enter'] = {
        function(question)
          if question.lang ~= 'rust' then
            return
          end
          local problem_dir = vim.fn.stdpath 'data' .. '/leetcode/Cargo.toml'
          local content = [[
                [package]
                name = "leetcode"
                edition = "2021"

                [lib]
                name = "%s"
                path = "%s"

                [dependencies]
                rand = "0.8"
                regex = "1"
                itertools = "0.14.0"
              ]]
          local file = io.open(problem_dir, 'w')
          if file then
            local formatted = (content:gsub(' +', '')):format(question.q.frontend_id, question:path())
            file:write(formatted)
            file:close()
            vim.cmd.RustAnalyzer 'restart'
          else
            print('Failed to open file: ' .. problem_dir)
          end
        end,
      },
    },
  },
}
