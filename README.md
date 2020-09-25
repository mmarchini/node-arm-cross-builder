# ARM cross-compilation of Node.js

## Building

```console
$ git clone git@github.com:mmarchini/node-arm-cross-builder.git
$ cd node-arm-cross-builder
$ docker build -t node-arm-cross-builder:latest .
$ cd /path/to/node/repo
$ docker run -it -v $(pwd):/node node-arm-cross-builder cross-compiler-ubuntu1804-armv7-gcc-6
```

## Testing

TBD
