FROM ubuntu:16.04

LABEL maintainer "Stefan Kuethe <crazycapivara@gmail.com>"

ENV BRANCH stable
ENV TAIGA_BACK taiga-back

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential binutils-doc autoconf flex bison libjpeg-dev \
	libfreetype6-dev zlib1g-dev libzmq3-dev libgdbm-dev libncurses5-dev \
	automake libtool libffi-dev libssl-dev curl git tmux gettext

# Install python
RUN apt-get install -y --no-install-recommends \
	python3 python3-pip python3-dev python3-setuptools \
	libxml2-dev libxslt-dev

# RUN rm -rf /var/lib/apt/lists/*

#ENV REQUIREMENTS requirements.txt
ENV REQUIREMENTS requirements-devel.txt

# Get taiga and install requirements
RUN git clone https://github.com/taigaio/taiga-back.git --branch $BRANCH $TAIGA_BACK

WORKDIR $TAIGA_BACK
	
RUN pip3 install --no-cache-dir -r $REQUIREMENTS \
	&& cp settings/local.py.example settings/local.py

COPY ./conf/local.py /$TAIGA_BACK/settings/local.py

EXPOSE 8000

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["bash"]
#CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]

