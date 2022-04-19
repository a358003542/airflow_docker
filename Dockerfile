FROM python:3.8

ARG uname=pycoder
ARG uid=1000
ARG gid=1000

ENV APP_PATH=/home/$uname/pycode
ENV DATA_PATH=/home/$uname/data

RUN if [ $uname != "root" ]; then groupadd -g $gid -o $uname; fi
RUN if [ $uname != "root" ]; then useradd -m -u $uid -g $uid -o -s /bin/bash -d /home/$uname $uname;fi

USER $uname

COPY pycode $APP_PATH

WORKDIR $APP_PATH

RUN pip install --no-cache-dir -r requirements.txt

VOLUME $DATA_PATH

