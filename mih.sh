#!/bin/bash
_mcchat_input="$(zenity --entry --text '保持 Minecraft 处于输入界面并在此输入内容：' --title 'Minecraft 输入辅助工具' )"
if [ "$_mcchat_input" = "" ]; then:
exit 1
fi
sleep 0.35
xdotool type --delay 100 "$_mcchat_input"
