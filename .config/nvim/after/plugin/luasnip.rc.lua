local ls = require("luasnip")
local types = require "luasnip.util.types"
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = ls.s
local i = ls.insert_node

ls.config.set_config {
  history = true,
  udateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "←", "Error" } },
      }
    }
  }
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable(-1) then
    ls.expand_or_jump(-1)
  end
end, {silent = true})

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice()
  end
end)


require("luasnip.loaders.from_snipmate").load({paths = "~/.config/nvim/lua/rlima/snippets"})
