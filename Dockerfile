FROM pshouse/squeak-base

RUN curl -o cogspurlinuxht.tgz http://www.mirandabanda.org/files/Cog/VM/VM.r3236/cogspurlinuxht-15.04.3236.tgz 

RUN tar xfvz cog*
WORKDIR /cogspurlinuxht
ADD smallCloud.image /cogspurlinuxht/ 
ADD smallCloud.changes /cogspurlinuxht/ 
#ADD squeak.conf /etc/security/limits.d/
#ADD limits.conf /etc/security/limits.d/

#RUN echo "*          hard   rtprio   2" >> /etc/security/limits.conf
#RUN echo "*          soft   rtprio   2" >> /etc/security/limits.conf
#RUN echo "ulimit -Hr 2" >> /root/.bashrc
#RUN echo "ulimit -Sr 2" >> /root/.bashrc
#RUN sed -i "/^# session/s/# //" /etc/pam.d/su

EXPOSE 80
CMD ["/cogspurlinuxht/bin/squeak", "-vm-sound-null -vm-display-null", "smallCloud.image"] 

