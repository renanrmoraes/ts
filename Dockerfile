FROM registry.access.redhat.com/jboss-eap-6/eap64-openshift

EXPOSE 8080 8888

RUN curl https://github.com/renanrmoraes/ts/blob/master/timesheet.war -o $JBOSS_HOME/standalone/deployments/ROOT.war
