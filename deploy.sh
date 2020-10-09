#!/bin/bash

# var
config_path="./nginx.conf"

# --------------------
echo '>>> 部署【nginx】'
# --------------------
# 首次部署创建必须目录(不存在文件夹则递归创建文件夹)
[ ! -d logs ] && mkdir -p logs
[ ! -d $HOME/www/sites ] && mkdir -p $HOME/www/sites
echo '主站访问正常.' >> $HOME/www/index.html
echo 'you are ok.' >> $HOME/www/sites/index.html

# 启动或重启`nginx`
pgrep -f code/nginx-openresty
if [[ $? != 0 ]]; then
  # -c 指定配置文件
  openresty -p $PWD -c $config_path
else
  openresty -p $PWD -c ${config_path} -s reload
fi

echo '部署成功'
# --------------------

echo '>>> 测试一下'
# --------------------

sleep 1
curl http://localhost:9998/sites/
exit 0
