FROM nginx:mainline-alpine3.18-slim

COPY dist/ /usr/share/nginx/html/
COPY docker/startup.sh /run/startup.sh

ENV BASE_DIR /usr/share/nginx/html

RUN chmod +x /run/startup.sh

CMD ["/run/startup.sh"]
