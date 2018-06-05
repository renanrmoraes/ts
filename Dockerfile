FROM registry.access.redhat.com/redhat-openjdk-18/openjdk18-openshift

EXPOSE 8080 8888


RUN curl https://github.com/renanrmoraes/ts/blob/master/timesheet.war -o $JAVA_HOME/standalone/deployments/ROOT.war


