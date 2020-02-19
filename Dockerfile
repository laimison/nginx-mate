FROM nginx:1.17.6
LABEL maintainer="Laimis Valatka laimison1@gmail.com"

RUN apt update
RUN apt install -y vim

RUN echo > /etc/nginx/conf.d/default.conf.template

RUN echo 'server {'                                         >> /etc/nginx/conf.d/default.conf.template 
RUN echo '    listen       80;'                             >> /etc/nginx/conf.d/default.conf.template
RUN echo '    server_name  xserver_namex;'                  >> /etc/nginx/conf.d/default.conf.template
RUN echo ''                                                 >> /etc/nginx/conf.d/default.conf.template
RUN echo '    location / {'                                 >> /etc/nginx/conf.d/default.conf.template
RUN echo '        proxy_pass  xproxy_passx;'                >> /etc/nginx/conf.d/default.conf.template
RUN echo '        xoptionsx'                                >> /etc/nginx/conf.d/default.conf.template
RUN echo '    }'                                            >> /etc/nginx/conf.d/default.conf.template
RUN echo '}'                                                >> /etc/nginx/conf.d/default.conf.template
RUN echo 'server {'                                         >> /etc/nginx/conf.d/default.conf.template
RUN echo '    listen 80    default_server;'                 >> /etc/nginx/conf.d/default.conf.template
RUN echo '    server_name  _;'                              >> /etc/nginx/conf.d/default.conf.template
RUN echo '    root /usr/share/nginx/html;'                  >> /etc/nginx/conf.d/default.conf.template
RUN echo '}'                                                >> /etc/nginx/conf.d/default.conf.template

ENV server_name="test.example.com"
ENV proxy_pass="http://localhost:8230/"
ENV options=""

RUN touch /pre.sh
RUN chmod +x /pre.sh

RUN echo 'cat /etc/nginx/conf.d/default.conf.template | sed -e "s|xserver_namex|${server_name}|g" | sed -e "s|xproxy_passx|${proxy_pass}|g" | sed -e "s|xoptionsx|${options}|g" > /etc/nginx/conf.d/default.conf' >> /pre.sh

CMD /pre.sh && nginx -g 'daemon off;'
