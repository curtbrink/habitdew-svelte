FROM nginx as production-stage
RUN mkdir /app
COPY ./build /app
COPY nginx.conf /etc/nginx/nginx.conf
