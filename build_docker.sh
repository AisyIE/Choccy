choccy_version=dev
docker build . -t aisyie/choccy:${choccy_version}
# docker run --rm -e TZ=Asia/Shanghai -p 22222:80 aisyie/choccy:${choccy_version} ./choccy 
# docker tag aisyie/choccy:${choccy_version} aisyie/choccy:latest
# docker push aisyie/choccy:${choccy_version}
# docker push aisyie/choccy:latest