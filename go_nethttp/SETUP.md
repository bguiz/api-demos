## Set up

```bash
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.8.3 -pb -b -B
gvm use go1.8.3 --default
echo $GOROOT
echo $GOPATH
mkdir -p go_nethttp
cd go_nethttp
go build
go test
```
