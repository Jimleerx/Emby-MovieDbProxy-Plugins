# Emby-MovieDbProxy-Plugins
Emby TMDB 刮削器的代理插件
# 刮削插件安装

# 这个插件是给无法访问TMDB的人使用的，使用一个VPS小只因代理访问TMDB，如果你可以访问TMDB，不需要安装这个插件

## 从群文件下载MovieDbProxy.dll

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled.png)

## 安装插件

### 插件放到群晖里，右键插件文件，点击属性，复制插件位置

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%201.png)

## 查看Emby安装位置

### 1. 点击套件中心，点击设置

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%202.png)

通常都是

/Volume1/@appdata/EmbyServer/plugins

如果没有显示默认存储空间，默认就是存储空间1

根据存储空间后面的数字，比如存储空间2，对应

/Volume2/@appdata/EmbyServer/plugins

### 新增定时任务

1. 点击群晖控制面板
2. 点击任务计划
3. 点击新建，输入任务名称，用户账号选root，已启动去除勾选，再点击任务设置

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%203.png)

1. 输入脚本，mv后面的两个路径分别是第一步从filestation复制的路径和上一步套件的路径

```jsx
mv /volume1/Test/MovieDbProxy.dll /volume1/@appdata/EmbyServer/plugins
chown emby:emby /volume1/@appdata/EmbyServer/plugins/MovieDbProxy.dll
chmod 644 /volume1/@appdata/EmbyServer/plugins/MovieDbProxy.dll
```

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%204.png)

1. 点击确定，弹出警告，再点确定
2. 运行脚本，右击脚本，点击运行

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%205.png)

## 查看插件是否安装

### 重启EMBY

### 进入EMBY设置，点击插件

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%206.png)

### 使用插件

媒体文件夹里的刮削器只勾选TheMovieDbProxy，保存后，刷新元数据

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%207.png)

### 使用插件

媒体文件夹里的刮削器只勾选TheMovieDbProxy，保存后，刷新元数据

![Untitled](https://cdn.jsdelivr.net/gh/Jimleerx/Emby-MovieDbProxy-Plugins@master/images/Untitled%207.png)
