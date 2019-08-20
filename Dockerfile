FROM dependency-check-wrapper-base:latest


MAINTAINER APPSEC <dc@dc>

COPY config.ini /usr/share/dependency-check/bin/
COPY HELP.txt /usr/share/dependency-check/bin/
COPY settings.xml /usr/share/dependency-check/bin/

USER dependencycheck

RUN sh /usr/share/dependency-check/bin/dependency-check.sh --updateonly
