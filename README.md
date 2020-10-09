# nginx-openresty

openresty服务器

下一个IP段：? [以10为单位递增，每个服务占据10个IP ]

## 如何部署

```bash
# 本地
sh deploy.sh
# 远程
sh deploy-remote.sh [YOUR_CUSTOM_HOST_NAME]
```

## 目录的服务：

* dev-recipe.hztywl.cn/sites/...

# OpenResty

&emsp;&emsp;官网 ➡️ [https://openresty.org/cn/](https://openresty.org/cn/)

## 安装说明

> https://openresty.org/cn/download.html

#### CentOS

```bash
# 安装依赖
yum install pcre-devel openssl-devel gcc curl -y
cd /data/soft
# 下载最新版
wget -c https://openresty.org/download/openresty-1.17.8.2.tar.gz
# 解压
tar -zxvf openresty-1.17.8.2.tar.gz
cd openresty-1.17.8.2
# 开始编译(默认目录`--prefix=/usr/local/openresty`)
./configure --prefix=/usr/local/openresty/
make && make install
# 添加以下环境变量
vim /etc/profile
# export PATH=$PATH:/usr/local/openresty/nginx/sbin/
source /etc/profile
# 创建软链接(可选)
cd /usr/bin/
ln -s /usr/local/openresty/nginx/sbin/nginx openresty
```

##### 添加 openresty 仓库(可选)
```bash
yum install yum-utils -y
yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
```

> 如果报错以下问题，原因是因为升级了`python`版本，需要将yum重新导向原来的python2.6解释器
```
Traceback (most recent call last):
  File "/usr/bin/yum-config-manager", line 6, in <module>
    import yum
ImportError: No module named yum
```

解决：

```bash
vim /usr/bin/yum-config-manager
# 修改第一行路径为`#!/usr/bin/python2.6 -tt`
```

#### Win

```bash
# 启动
start nginx.exe
# 停止
nginx.exe -s stop
# 杀掉所有进程
taskkill /fi "imagename eq nginx.exe" /f
# 查看进程
tasklist /fi "imagename eq nginx.exe"
```