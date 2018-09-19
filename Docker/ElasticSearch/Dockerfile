FROM yourRegistry/elasticsearch:2.4.4
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get install zip
RUN mkdir -p /usr/share/elasticsearch/plugins/ik
RUN cd /usr/share/elasticsearch/plugins/ik && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v1.10.4/elasticsearch-analysis-ik-1.10.4.zip && unzip elasticsearch-analysis-ik-1.10.4.zip
RUN /usr/share/elasticsearch/bin/plugin install delete-by-query