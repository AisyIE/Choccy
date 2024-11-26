rm -r ../Choccy/assets
cd web
npm install
npm run build
cd ..
go build -o choccy_linux_amd64 main.go
./choccy_linux_amd64
# choccy_version=dev
# docker run --rm -e TZ=Asia/Shanghai -p 22222:80 aisyie/choccy:${choccy_version} ./choccy 