require("config.lazy")

-- 当前行高亮
vim.wo.cursorline = true

-- 显示行号
vim.opt.number = true

-- nvim-tree 配置
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 透明背景
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
]])