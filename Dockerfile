FROM debian:9

ADD sources.list /etc/apt/sources.list
RUN apt update
RUN apt install wget -y

#RUN wget http://soft.lnmp.com/lnmp/lnmp2.0.tar.gz -O lnmp2.0.tar.gz && tar zxf lnmp2.0.tar.gz && cd lnmp2.0 && LNMP_Auto="y" DBSelect="0" PHPSelect="9" SelectMalloc="1" ApacheSelect="2" ServerAdmin="jia.golb@gmail.com" ./install.sh lamp
RUN wget http://soft.lnmp.com/lnmp/lnmp2.0.tar.gz -O lnmp2.0.tar.gz && tar zxf lnmp2.0.tar.gz && cd lnmp2.0 && LNMP_Auto="y" DBSelect="0" PHPSelect="9" SelectMalloc="3" CheckMirror="n" ./install.sh lnmp

RUN rm -rf /lnmp*
RUN rm -rf /root/lnmp*
RUN rm -rf /home/wwwroot/default/*
RUN apt clean
ADD run.sh /run.sh
RUN chmod 777 /run.sh
RUN touch /opt/1.txt

EXPOSE 80
EXPOSE 443

#ENTRYPOINT ["lnmp","start"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD ["./run.sh"]
#CMD ["/etc/init.d/httpd", "start"]
