FROM jbarlow83/ocrmypdf
RUN apt-get update && apt-get install -y --no-install-recommends python3-venv
USER root
RUN ls /
RUN mkdir -p /app/appenv
RUN mkdir -p /appenv
RUN python3 -m venv /appenv
RUN python3 -m venv appenv
RUN ls ./
WORKDIR /app

ADD requirements.txt /app

RUN pip install -r requirements.txt

ADD server.py index.htm entrypoint.sh /app/
ADD static /app/static/

USER docker

ENTRYPOINT ["/app/entrypoint.sh"]
