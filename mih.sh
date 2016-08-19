#!/bin/bash
helptext="用法:\n
	mih.sh [时间]	指定向Minecraft输出字符时字符间的间隔时间(毫秒)，默认100\n
	mih.sh --help	显示本页面"
time_s=100
if [ "$#" -gt 1 ]; then
	echo "太多的参数" >&2
	echo -e "$helptext" >&2
	exit 1
fi
case $# in #参数处理
	"0");;
	"1")
		if [ "$1" = "--help" ]; then 
			echo -e "$helptext"
			exit 0
		fi
		if grep '^[[:digit:]]*$' <<< "$1"; then #判断是否为数字
			if [ "$1" -lt 0 ]; then
				echo 无效的参数 "$1"
				echo -e "$helptext" >&2
				exit 1
			else
				time_s="$1"
			fi
		else
			echo 无效的参数 "$1"
			echo -e "$helptext" >&2
			exit 1;
		fi
		;;
esac
_mcchat_input="$(zenity --entry --text '保持 Minecraft 处于输入界面并在此输入内容：' --title 'Minecraft 输入辅助工具' )"
if [ "$_mcchat_input" = "" ]; then
	exit 0
fi
	sleep 0.35
	xdotool type --delay $time_s "$_mcchat_input"
