# 기초 도커 이미지
FROM nginx:alpine
# 도커 이미지 라벨(타이틀) 설정
LABEL org.opencontainers.image.title="my-custom-nginx"
# 컨테이너에서 사용되는 환경 변수 설정
ENV APP_ENV=dev
COPY ./app/src /usr/share/nginx/html
