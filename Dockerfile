FROM jbarlow83/ocrmypdf

USER root

RUN apt-get update && apt-get install -y --no-install-recommends python3-venv

RUN mkdir -p /app/appenv
RUN mkdir -p /appenv
RUN python3 -m venv /appenv
RUN python3 -m venv appenv

WORKDIR /app

ADD requirements.txt /app

RUN pip3 install -r requirements.txt

ADD server.py index.htm entrypoint.sh /app/
ADD static /app/static/

USER daemon

ENTRYPOINT ["/app/entrypoint.sh"]
