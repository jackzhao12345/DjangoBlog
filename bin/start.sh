#!/bin/bash
yum -y  install  mysql-devel  centos-release-scl 
yum -y install rh-python38 rh-python38-python-devel rh-python38-python-pip 
yum -y install supervisor
echo "export PATH=$PATH:/opt/rh/rh-python38/root/bin/:/opt/rh/rh-python38/root/usr/local/bin/" >> /etc/profile
source /etc/profile
pip install --upgrade pip -i https://pypi.douban.com/simple/ && \
        pip install -i https://pypi.douban.com/simple/ -Ur requirements.txt  && \
        pip install -i https://pypi.douban.com/simple/ gunicorn[gevent] && \
        pip cache purge
ln -s  /opt/rh/rh-python38/root/usr/local/bin/gunicorn  /usr/bin/
ln -s  /opt/rh/rh-python38/root/usr/bin/pip3  /usr/bin/
ln -s  /opt/rh/rh-python38/root/usr/bin/python3  /usr/bin/
supervisord -c wsgi.ini