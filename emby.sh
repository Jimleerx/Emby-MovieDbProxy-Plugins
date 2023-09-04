#!/bin/bash
domain="https://crackemby.2ha.me"
folder_path="/dll"
server_path=$domain$folder_path
emby_system_root="/var/packages/EmbyServer/target/system"

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
    plugin_path="/volume1/@appdata/EmbyServer/plugins"
    if [ -d "$plugin_path" ]; then
        echo "Emby 插件目录: $plugin_path"
    else
        # if plugin path does not in default path, find that in volume[1~16].
        for ((i=1;i<=16;i++))
            do
                appdata="/volume$i/@appdata/EmbyServer/plugins"
                if [ -d "$plugin_path" ]; then
                    echo "Emby 插件目录: $plugin_path"
                    break
                fi
        done
    fi
    movieDbPlugin="$plugin_path/MovieDbProxy.dll"
    rm -f ${movieDbPlugin}
    curl -s -k -o ${movieDbPlugin} $domain/dll/MovieDbProxy.dll
    chown emby:emby ${movieDbPlugin}
    chmod 644 ${movieDbPlugin}
    echo "请重启emby检查插件列表是否包含MovieDbProxy，并设置MovieDbProxy为首选刮削器"  
}

function happy(){
    clear

    version=$1

    esi=$emby_system_root/Emby.Server.Implementations.dll
    ew=$emby_system_root/Emby.Web.dll 
    mm=$emby_system_root/MediaBrowser.Model.dll 
    ep=$emby_system_root/dashboard-ui/embypremiere/embypremiere.js
    rm -f ${esi} ${ew} ${mm} ${ep}
    curl -s -k -o ${esi} $server_path/${version}/Emby.Server.Implementations.dll
    curl -s -k -o ${ew} $server_path/${version}/Emby.Web.dll
    curl -s -k -o ${mm} $server_path/${version}/MediaBrowser.Model.dll
    curl -s -k -o ${ep} $server_path/${version}/embypremiere.js
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
