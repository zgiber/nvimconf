return {
  'ggandor/lightspeed.nvim',
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    require("lightspeed").setup {}
  end,
}
