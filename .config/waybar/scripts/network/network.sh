#!/bin/bash

# 获取默认网络接口名称
# INTERFACE=$(ip -o -4 route show default | awk '{print $5}' | head -n1)
INTERFACE=$(nmcli con show --active | awk '/ethernet/ {print $1" "$2" "$3}')

# 输出 Waybar 格式的 JSON
# echo "{\"text\": \" $INTERFACE\", \"tooltip\": \"默认网络接口: $INTERFACE\"}"
echo "  $INTERFACE "
#         
