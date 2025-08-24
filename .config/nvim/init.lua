require("config.lazy")

-- 当前行高亮
vim.wo.cursorline = true

-- 显示行号
vim.opt.number = true

-- 透明背景
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
]])
vim.g.neovide_opacity = 0.0

-- Neovide
if vim.g.neovide then
  -- 设置窗口透明度为 35%
  vim.g.neovide_transparency = 0.30
  
  -- 计算透明度十六进制值
  local alpha = string.format("%02x", math.floor(0.30 * 255))
  
  -- 设置背景色
  vim.g.neovide_background_color = "#1e1e2e" .. alpha  -- Catppuccin 风格

  -- 设置模糊效果（关键：实现毛玻璃效果）
  vim.g.neovide_floating_blur_amount_x = 12.0  -- 水平模糊强度
  vim.g.neovide_floating_blur_amount_y = 12.0  -- 垂直模糊强度
  
  -- 全局背景模糊
  vim.g.neovide_background_blur_amount = 8.0   -- 整体背景模糊强度

  -- 其他优化设置
  -- vim.g.neovide_hide_mouse_when_typing = true    -- 输入时隐藏鼠标
  -- vim.g.neovide_cursor_vfx_mode = "railgun"      -- 光标特效
  -- vim.g.neovide_remember_window_size = true      -- 记住窗口大小
  -- vim.g.neovide_fullscreen = false               -- 不全屏启动

  -- 字体设置
  -- vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h11"
end


-- 快捷键


-- nvim-tree 配置
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1