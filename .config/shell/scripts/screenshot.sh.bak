screenshot() {
    local filename="Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
    command grim ${HOME}/Pictures/"$filename" && \
    dbus-send --session --dest=org.freedesktop.Notifications --type=method_call \
    /org/freedesktop/Notifications org.freedesktop.Notifications.Notify \
    uint32:0 string:"grim" string:"Screenshot saved." string:"$filename" \
    array:string:'' dict:string:string:''
}
# screenshot() {
#     local filename="Screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"
#     command grim ${HOME}/Pictures/"$filename" && \
#     dbus-send \
#         --session \                     # 使用当前用户的会话（session）总线，而非系统（system）总线
#         --dest=org.freedesktop.Notifications \  # 指定目标服务（这里是通知服务）
#         --type=method_call \            # 表示这是一个方法调用（D-Bus 支持方法调用和信号发送）
#         /org/freedesktop/Notifications \ # 对象路径（服务的具体对象）
#         org.freedesktop.Notifications.Notify \  # 调用的方法名（显示通知）
#         uint32:0 \                      # 替换通知的 ID（0 表示不替换，总是新通知）
#         string:"grim" \                 # 应用程序名称
#         string:"Screenshot saved." \    # 通知的标题（Summary）
#         string:"$filename" \            # 通知的正文（Body），内容是变量 $filename 的值
#         array:string:'' \               # 通知的动作按钮（这里为空，表示无按钮）
#         dict:string:string:''           # 通知的附加提示信息（这里为空）
# }