FROM registry.wang-guanjia.com:5000/java:8
MAINTAINER happylifeplat
VOLUME /tmp
EXPOSE 8092
ENV TZ=Asia/Shanghai
#定义环境变量，脚本中需要获取
ENV env=dev
ENV APP_NAME=happylife-service-search
ENV JAR_PATH=/happylife-service-search.jar
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN mkdir -p /logs/
ADD happylife-service-search/target/happylife-service-search.jar $JAR_PATH
RUN bash -c 'touch /happylife-service-search.jar'
COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]