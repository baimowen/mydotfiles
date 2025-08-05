#!/bin/bash

# 定义路径和文件名格式
SCREENSHOT_DIR="$HOME/Pictures"
VIDEO_DIR="$HOME/Videos"
TIMESTAMP=$(date "+%Y%m%d-%H%M%S")
SCREENSHOT_NAME="Screenshot_$TIMESTAMP.png"
RECORD_NAME="Record_$TIMESTAMP.mp4"
RECORD_PID_FILE="/tmp/wf-recorder.pid"
RECORD_LOCK_FILE="/tmp/wf-recorder.lock"
LOG_FILE="/tmp/wf-recorder.log"

# 处理点击事件
case $1 in
    "screenshot")
        # 全屏截图
        grim "$SCREENSHOT_DIR/$SCREENSHOT_NAME"
        notify-send "截图已保存" "$SCREENSHOT_NAME 已保存到 $SCREENSHOT_DIR" -i "$SCREENSHOT_DIR/$SCREENSHOT_NAME"
        ;;
    "record")
        if [ -f "$RECORD_LOCK_FILE" ]; then
            # 结束录屏
            pkill -f "wf-recorder.*$VIDEO_DIR" && rm "$RECORD_LOCK_FILE"
            notify-send "录屏已保存" "$RECORD_NAME 已保存到 $VIDEO_DIR"
            echo '{"text":"","tooltip":"截图/录屏"}'
        else
            # 开始录屏
            touch "$RECORD_LOCK_FILE"
            wf-recorder -f "$VIDEO_DIR/$RECORD_NAME" --no-audio > "$LOG_FILE" 2>&1 &
            echo '{"text":"●","class":"recording","tooltip":"录屏中 (点击结束)"}'
        fi
        ;;
    *)
        if [ -f "$RECORD_LOCK_FILE" ]; then
            echo '{"text":"●","class":"recording","tooltip":"录屏中 (点击结束)"}'
        else
            echo '{"text":" ","tooltip":"截图/录屏 (左键: 截图, 右键: 录屏)"}'
        fi
        ;;
esac