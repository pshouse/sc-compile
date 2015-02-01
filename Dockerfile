FROM pshouse/squeak-base

RUN curl -o cogspurlinuxht.tgz http://www.mirandabanda.org/files/Cog/VM/VM.r3236/cogspurlinuxht-15.04.3236.tgz 

RUN tar xfvz cog*
WORKDIR /cogspurlinuxht
ADD smallCloud.image /cogspurlinuxht/ 
ADD smallCloud.changes /cogspurlinuxht/ 
ADD squeak.conf /etc/security/limits.d/
PORT 80
CMD ["./squeak", "-vm-sound-null -vm-display-null", "smallCloud.image"] 

