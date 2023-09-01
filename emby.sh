#!/bin/bash
function green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
function red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
function embyVersionMenu(){
    clear
    green " =================================================="
    green " 支持以下版本解锁开心"
    green " 1. Emby 4.7.14"
    green " 2. Emby 4.8.44"
    echo
    read -p "请选择: " userin
    case "${userin}" in
        1 )
            echo "开始解锁4.7.14版本"
            happy "4.7.14"
        ;;
        2 )
            echo "开始解锁4.8.44版本"
            happy "4.8.44"
        ;;
        * )
            red " 请输入数字 1 或 2"
            start
        ;;
    esac
}

function tmdbproxy(){
    clear 
    movieDbPlugin=/volume1/@appdata/EmbyServer/plugins/MovieDbProxy.dll
    rm -f ${movieDbPlugin}
    curl -s -k -o ${movieDbPlugin} https://crackemby.2ha.me/dll/MovieDbProxy.dll
    chown emby:emby ${movieDbPlugin}
    chmod 644 ${movieDbPlugin}
    echo "请重启emby检查插件列表是否包含MovieDbProxy，并设置MovieDbProxy为首选刮削器"  
}

function happy(){
    clear

    version=$1

    esi=/var/packages/EmbyServer/target/system/Emby.Server.Implementations.dll
    ew=/var/packages/EmbyServer/target/system/Emby.Web.dll 
    mm=/var/packages/EmbyServer/target/system/MediaBrowser.Model.dll 
    ep=/var/packages/EmbyServer/target/system/dashboard-ui/embypremiere/embypremiere.js
    rm -f ${esi} ${ew} ${mm} ${ep}
    curl -s -k -o ${esi} https://crackemby.2ha.me/dll/${version}/Emby.Server.Implementations.dll
    curl -s -k -o ${ew} https://crackemby.2ha.me/dll/${version}/Emby.Web.dll
    curl -s -k -o ${mm} https://crackemby.2ha.me/dll/${version}/MediaBrowser.Model.dll
    curl -s -k -o ${ep} https://crackemby.2ha.me/dll/${version}/embypremiere.js
    chown emby:emby ${esi} ${ew} ${mm} ${ep}
    chmod 644 ${esi} ${ew} ${mm} ${ep}
    echo "重启Emby后在激活页面输入任意激活码即可开心"
}
function start(){
    echo
    green " ====================================================================================================="
    green " Emby开心脚本 | 2023-9-1 ｜ 系统支持: DSM7 / DSM7.2 / DSM6 | 支持 Emby 4.8.44 / 4.7.14 QQ群: 675406101 "
    green " ====================================================================================================="
    green " 1. 开心"
    green " 2. 安装TMDB代理刮削插件"  
    echo
    read -p "请选择: " userin
    
    case "${userin}" in
        1 )
            echo "进入开心菜单"
            embyVersionMenu
        ;;
        2 )
            echo "开始安装免FQ刮削插件"
            tmdbproxy
        ;;
        * )
            red " 请输入数字 1 或 2"
            start
        ;;
    esac

}

start
