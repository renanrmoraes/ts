FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat7-openshift

EXPOSE 8080 8888

COPY timesheet $JWS_HOME/ts

RUN curl https://github.com/renanrmoraes/ts/blob/master/timesheet.war -o $HOME/deployments/ROOT.war


