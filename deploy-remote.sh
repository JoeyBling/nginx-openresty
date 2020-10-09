#!/bin/bash
# 部署到远程
# 
# --- 准备工作 ---
# 1. 在需要部署的远程主机(REMOTE_HOST)拉取源代码: 
# mkdir -p ~/code/
# git clone http://xiaojp:55555@gogs-git.hztywl.cn/basic_plat_dept/recipe-nginx-openresty ~/code/nginx-openresty --branch dev

# 2. 在本地做好对远程主机的SSH免登录
# 
# --- 本机执行下下命令 ----
# sh deploy-remote.sh [YOUR_CUSTOM_HOST_NAME]


# --------------------
echo '>>> 执行SSH'
# --------------------
[[ $1 ]] && YOUR_REMOTE_HOST_NAME=$1 || YOUR_REMOTE_HOST_NAME=webdev

ssh $YOUR_REMOTE_HOST_NAME " \
  cd ~/code/nginx-openresty; \
  git checkout -- .; \
  git pull origin dev; \
  sh -x deploy.sh 2>deploy.log; grep -Ei \"error|错误|fatal|fail|emerg\" deploy.log;
"
