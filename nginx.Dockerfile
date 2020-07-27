FROM nginx:1.13
LABEL mainteiner="dikadhr3Z@gmail.com"
RUN apt-get update && apt-get install curl -y
RUN apt-get clean && \ 
     apt-get autoremove -y
COPY myweb-app/nginx.conf /etc/nginx/conf.d/default.conf
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://localhost/ || exit 1
