FROM python:3
ENV PYTHONUNBUFFERED 1
WORKDIR /code/djangoblog/
RUN  apt-get install  default-libmysqlclient-dev -y && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
ADD requirements.txt requirements.txt
RUN pip install --upgrade pip -i https://pypi.douban.com/simple/ && \
        pip install -i https://pypi.douban.com/simple/ -Ur requirements.txt  && \
        pip install -i https://pypi.douban.com/simple/ gunicorn[gevent] && \
        pip cache purge
        
# RUN chmod +x /docker_start.sh
# ENTRYPOINT ["/docker_start.sh"]
