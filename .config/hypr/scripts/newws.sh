#! /bin/bash
# 该脚本用于将焦点窗口移动到新工作区并切换过去

# 获取当前窗口地址
window=$(hyprctl activewindow -j | jq -r '.address')

# 获取下一个可用工作区id
next_workspace=$(hyprctl workspaces -j | jq 'map(.id) | max + 1')

# 移动焦点窗口到新工作区
hyprctl dispatch movetoworkspace "$next_workspace,address:$window"
# 切换到新工作区
hyprctl dispatch workspace "$next_workspace"