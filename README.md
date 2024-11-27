# meng-admin-gin
meng admin gin服务端实现


#打包
mac下打包amd
```shell
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o meng-admin main.go

```
