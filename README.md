# Cemilee

Cemilee is an asynchronous http micro service based on [Kemal](http://github.com/sdogruyol/kemal).

## Installation
```
brew install crystal-lang
git clone https://github.com/readtimeout/cemilee
cd cemilee
shards install
```
## Build and Run
```
crystal build --release src/cemilee.cr
./cemilee
```
## Usage
```
curl -X POST -H 'Content-Type: application/json' -d '[{ "method": "GET", "url": "http://httpbin.org/delay/1"}, {"method": "POST", "url": "http://httpbin.org/post", "payload": {"category": 2} }]' http://localhost:3000
```
> ["{"args": {}, "data": "", "files": {}, "form": {}, "headers": {  "Accept-Encoding": "gzip, deflate",   "Content-Length": "0",   "Host": "httpbin.org",   "User-Agent": "Crystal"  }, "origin": "127.0.0.1", "url": "http://httpbin.org/delay/1"}", "{"args": {}, "data": "{"category" => 2}", "files": {}, "form": {}, "headers": {  "Accept-Encoding": "gzip, deflate",   "Content-Length": "17",   "Host": "httpbin.org",   "User-Agent": "Crystal"  }, "json": null, "origin": "127.0.0.1", "url": "http://httpbin.org/post"}"]

## Contributing

1. Fork it ( https://github.com/readtimeout/cemilee/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[readtimeout]](https://github.com/readtimeout) Read Timeout - creator, maintainer
