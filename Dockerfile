ARG SONARQUBE_VERSION
ARG PLUGIN_VERSION

# FROM gradle:7.3.3-jdk11-alpine as builder

# COPY . /home/build/project
# WORKDIR /home/build/project
# RUN gradle build -x test

FROM sonarqube:${SONARQUBE_VERSION}
# COPY --from=builder --chown=sonarqube:sonarqube /home/build/project/build/libs/sonarqube-community-branch-plugin-*.jar /opt/sonarqube/extensions/plugins/
COPY --chown=sonarqube:sonarqube ./plugins/sonarqube-community-branch-plugin-1.14.0.jar /opt/sonarqube/extensions/plugins/

ENV PLUGIN_VERSION=${PLUGIN_VERSION}
ENV SONAR_WEB_JAVAADDITIONALOPTS="-javaagent:./extensions/plugins/sonarqube-community-branch-plugin-1.14.0.jar=web"
ENV SONAR_CE_JAVAADDITIONALOPTS="-javaagent:./extensions/plugins/sonarqube-community-branch-plugin-1.14.0.jar=ce"