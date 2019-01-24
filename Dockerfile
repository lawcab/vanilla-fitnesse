FROM lawcab/baseimage
MAINTAINER Lawrence Cabal <lawcab@gmail.com>

#install jdk
RUN mkdir /usr/local/java \
&& cd /usr/local/java \
&& wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz \
&& tar xvzf jdk-8u201-linux-x64.tar.gz \
&& echo 'JAVA_HOME=/usr/local/java/jdk1.8.0_201' >> /etc/profile \
&& echo 'PATH=$PATH:$HOME/bin:$JAVA_HOME/bin' >> /etc/profile \
&& echo 'export JAVA_HOME' >> /etc/profile \
&& echo 'export PATH' >> /etc/profile 
RUN  update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_201/bin/java" 1 \
&& update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_201/bin/javaws" 1 \
&& update-alternatives --set java /usr/local/java/jdk1.8.0_201/bin/java \
&& update-alternatives --set javaws /usr/local/java/jdk1.8.0_201/bin/javaws

#install fitnesse
RUN wget "http://docs.fitnesse.org/fitnesse-standalone.jar?responder=releaseDownload&release=20190119"
RUN mv "fitnesse-standalone.jar?responder=releaseDownload&release=20190119" "fitnesse-standalone.jar"
RUN mkdir /usr/local/fitnesse
RUN mv fitnesse-standalone.jar /usr/local/fitnesse
RUN mkdir /prj