#!/bin/bash

# 颜色定义
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# 交互菜单
while true; do
    clear    clear
    echo -e "${GREEN}====== Ubuntu 控制命令菜单 ======${NC}"
    echo "1. 系统信息"    echo "1. 系统信息"
    echo "2. 系统监控"
    echo "3. 关机 / 重启"
    echo "4. 用户管理"
    echo "5. 软件管理"
    echo "6. 网络管理"
    echo "7. 存储管理"
    echo "8. 进程管理"
    echo "9. 日志管理"
    echo "10. 防火墙管理"
    echo "11. SSH 远程管理"
    echo "12. 退出"
    echo -n "请选择操作（输入编号）："
    
    read choice

    case $choice in
        1)
            echo -e "${GREEN}系统信息:${NC}"
            uname -a
            hostname
            uptime
            whoami
            who
            id
            ;;
        2)
            echo -e "${GREEN}系统监控:${NC}"
            top
            ;;
        3)
            echo -e "${GREEN}关机 / 重启:${NC}"
            echo "1) 立即关机"
            echo "2) 立即重启"
            echo "3) 取消"
            read sub_choice
            case $sub_choice in
                1) sudo shutdown -h now ;;
                2) sudo reboot ;;
                3) ;;
            esac
            ;;
        4)
            echo -e "${GREEN}用户管理:${NC}"
            echo "1) 添加用户"
            echo "2) 删除用户"
            echo "3) 显示当前用户组"
            read sub_choice
            case $sub_choice in
                1) read -p "请输入用户名: " user; sudo adduser $user ;;
                2) read -p "请输入用户名: " user; sudo deluser $user ;;
                3) id ;;
            esac
            ;;
        5)
            echo -e "${GREEN}软件管理:${NC}"
            echo "1) 更新软件包"
            echo "2) 安装软件"
            echo "3) 卸载软件"
            read sub_choice
            case $sub_choice in
                1) sudo apt update && sudo apt upgrade ;;
                2) read -p "请输入软件包名称: " package; sudo apt install $package ;;
                3) read -p "请输入软件包名称: " package; sudo apt remove $package ;;
            esac
            ;;
        6)
            echo -e "${GREEN}网络管理:${NC}"
            echo "1) 查看 IP 地址"
            echo "2) 测试网络连接"
            echo "3) 显示监听端口"
            read sub_choice            read sub_choice
            case $sub_choice in
                1) ip a ;;
                2) read -p "请输入要 Ping 的地址: " addr; ping -c 4 $addr ;;
                3) ss -tulnp ;;
            esac
            ;;
        7)
            echo -e "${GREEN}存储管理:${NC}"
            echo "1) 查看磁盘使用情况"            echo "1) 查看磁盘使用情况"
            echo "2) 挂载磁盘"
            echo "3) 卸载磁盘"
            read sub_choice
            case $sub_choice in
                1) df -h ;;
                2) read -p "请输入设备路径（如 /dev/sdb1）: " dev; read -p "请输入挂载点（如 /mnt）: " mnt; sudo mount $dev $mnt ;;
                3) read -p "请输入卸载路径: " mnt; sudo umount $mnt ;;
            esac
            ;;
        8)
            echo -e "${GREEN}进程管理:${NC}"
            echo "1) 显示所有进程"
            echo "2) 终止进程"
            read sub_choice
            case $sub_choice in
                1) ps aux ;;
                2) read -p "请输入要终止的进程 PID: " pid; sudo kill -9 $pid ;;
            esac
            ;;
        9)
            echo -e "${GREEN}日志管理:${NC}"
            echo "1) 查看系统日志"            echo "1) 查看系统日志"
            echo "2) 查看内核日志"
            read sub_choice
            case $sub_choice in            case $sub_choice in
                1) journalctl -xe ;;
                2) dmesg | tail -20 ;;
            esac
            ;;
        10)
            echo -e "${GREEN}防火墙管理:${NC}"
            echo "1) 启用防火墙"
            echo "2) 禁用防火墙"
            echo "3) 允许 SSH 端口"
            read sub_choice
            case $sub_choice in
                1) sudo ufw enable ;;                1) sudo ufw enable ;;
                2) sudo ufw disable ;;
                3) sudo ufw allow 22/tcp ;;
            esac            esac
            ;;            ;;            ;;            ;;            ;;            ;;            ;;            ;;
        11)        11)
            echo -e "${GREEN}SSH 远程管理:${NC}"            echo -e "${GREEN}SSH 远程管理:${NC}"
            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"            echo "1) 远程登录"
            echo "2) 复制文件到远程主机"            echo "2) 复制文件到远程主机"            echo "2) 复制文件到远程主机"            echo "2) 复制文件到远程主机"
            read sub_choice            read sub_choice
            case             case $sub_choice in            case             case $sub_choice in            case             case $sub_choice in            case             case $sub_choice in
                1) read -p "请输入远程地址（user@host）: " remote; ssh $remote ;;
                2) read -p "请输入文件路径: " file; read -p "请输入远程地址（user@host）: " remote; scp $file $remote:~ ;;                2) read -p "请输入文件路径: " file; read -p "请输入远程地址（user@host）: " remote; scp $file $remote:~ ;;
            esac            esac
            ;;
        12        12)
            echo             echo -e "${GREEN}退出脚本${NC}"
            exit 0
            ;;            ;;            ;;            ;;            ;;            ;;            ;;            ;;
        *)        *)
            echo "无效选项，请重新选择！"            echo "无效选项，请重新选择！"
            ;;            ;;
    esac

    echo -e "${GREEN}按回车键继续...${NC}"
    read
done
