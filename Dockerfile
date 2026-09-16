FROM nginx:alpine
# Copia os arquivos estáticos
COPY cronograma_estudos.html /usr/share/nginx/html/index.html
# Remove as configurações padrões do NGINX
RUN rm -rf /usr/share/nginx/html/* /etc/nginx/conf.d/default.conf
# Permissões de usuário não-root por boas práticas de segurança
RUN chown -R nginx:nginx /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]