#! /bin/bash
##############################################################################

## 定义发行版判定变量
SYSTEM_ARCH="Arch"
SYSTEM_NIXOS="NixOS"
SYSTEM_FEDORA="Fedora"
SYSTEM_DEBIAN="Debian"
SYSTEM_UBUNTU="Ubuntu"

## 定义颜色和样式变量
RED='\033[31m'
GREEN='\033[32m'
YELLOW='\033[33m'
BLUE='\033[34m'
PURPLE='\033[35m'
AZURE='\033[36m'
PLAIN='\033[0m'
BOLD='\033[1m'
SUCCESS="\033[1;32m✔${PLAIN}"
COMPLETE="\033[1;32m✔${PLAIN}"
WARN="\033[1;43m 警告 ${PLAIN}"
ERROR="\033[1;31m✘${PLAIN}"
FAIL="\033[1;31m✘${PLAIN}"
TIP="\033[1;44m 提示 ${PLAIN}"
WORKING="\033[1;36m◉${PLAIN}"

##############################################################################

## 判断用户是否为root
function is_root() {
    if [ "$(id -u)" == "0" ]; then
        echo -e "${ERROR}请勿使用 root 用户运行此脚本！${PLAIN}"
        exit 1
    fi
}

## 定义日志存放路径
function save_log() {
    LOGFILE="$HOME/setup.log"
    [ -f $LOGFILE ] && rm -f $LOGFILE
    exec &> >(tee -a $LOGFILE)
    echo -e "${TIP}日志存放路径为: ${LOGFILE}${PLAIN}"
}

## 检测发行版类型
function collect_system_info() {
    local File_LinuxRelease="/etc/os-release"

    ## 定义发行版名称
    SYSTEM_NAME="$(awk -F '=' '/^NAME=/{gsub("\"", "", $2); print $2}' $File_LinuxRelease)"
    SYSTEM_ID="$(awk -F '=' '/^ID=/{gsub("\"", "", $2); print $2}' $File_LinuxRelease)"
    # echo ${SYSTEM_NAME} ${SYSTEMC_ID}

    # 判定发行版类型
    case "${SYSTEM_ID}" in
        arch)
            SYSTEM_FACTIONS="${SYSTEM_ARCH}"
            ;;
        nixos)
            SYSTEM_FACTIONS="${SYSTEM_NIXOS}"
            ;;
        fedora)
            SYSTEM_FACTIONS="${SYSTEM_FEDORA}"
            ;;
        debian)
            SYSTEM_FACTIONS="${SYSTEM_DEBIAN}"
            ;;
        ubuntu)
            SYSTEM_FACTIONS="${SYSTEM_UBUNTU}"
            ;;
    esac

    if [[ -z "${SYSTEM_FACTIONS}" ]]; then
        unsupport_system_error "不支持该发行版"
    fi

    ## 输出检测结果
    # echo "系统名称: ${SYSTEM_NAME}"
    # echo "系统类型: ${SYSTEM_FACTIONS}"
}

function backup_config() {
    read -p "是否备份当前配置文件？(y/n)" backup_choice
    case $backup_choice in
        [yY])
            echo -e "${BLUE}正在备份当前配置文件...${PLAIN}"
            tar -czvf ${HOME}/config_backup.tar.gz ${HOME}/.config && echo -e "${GREEN}配置文件已备份到 ${HOME}/config_backup.tar.gz${PLAIN}"
            ;;
        [nN])
            echo -e "${YELLOW}跳过备份.${PLAIN}"
            ;;
        *)
            echo -e "${WARN}无效选择，已跳过备份.${PLAIN}"
            ;;
    esac  
}

function setup_config() {
    echo -e "${GREEN}正在克隆仓库...${PLAIN}"
    # if ! git clone https://github.com/baimowen/mydotfiles.git ~/mydotfiles; then
    #     echo -e "${ERROR}仓库克隆失败.${PLAIN}"
    #     exit 1
    # fi
    git clone https://github.com/baimowen/mydotfiles.git ~/mydotfiles || { echo -e "${ERROR}仓库克隆失败.${PLAIN}"; exit 1; }
    if [ -d ${HOME}/.config ]; then
        read -p "检测到已有配置文件目录，是否覆盖？(y/n)" overwrite_choice
        case $overwrite_choice in
            [yY])
                echo -e "${BLUE}正在覆盖配置文件${PLAIN}"
                rm -rf ${HOME}/.config/* \
                    && cp -a ~/mydotfiles/.config/* ${HOME}/.config/ \
                    && cp -a ~/mydotfiles/.tmux.conf ~/mydotfiles/.zshrc ~/mydotfiles/.zprofile ~/mydotfiles/.vimrc ${HOME}/ \
                    && echo -e "${SUCCESS}配置文件安装完成！${PLAIN}"
                ;;
            [nN])
                echo -e "${YELLOW}跳过覆盖.${PLAIN}"
                exit 0
                ;;
            *)
                echo -e "${WARN}无效选择，已跳过覆盖.${PLAIN}"
                exit 1
                ;;
        esac
    else
        mkdir -p "${HOME}/.config"
        cp -a ~/mydotfiles/.config/* "${HOME}/.config"/
        cp -a ~/mydotfiles/.tmux.conf ~/mydotfiles/.zshrc ~/mydotfiles/.zprofile ~/mydotfiles/.vimrc ${HOME}/
        echo -e "${SUCCESS}配置文件安装完成！${PLAIN}"
    fi
}

function main() {

    # 日志
    save_log

    # 检测系统信息
    # collect_system_info

    # 判断root
    is_root

    # 备份
    backup_config

    # 安装配置文件
    setup_config  
}

main