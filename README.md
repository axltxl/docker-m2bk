#m2bk as a Docker container

Isn't that nice?, not only to have [m2bk](https://github.com/axltxl/m2bk) for your mongo backups but also to isolate its execution inside a container (which also could be run spontaneously to be later torn down just like that)?, well ... now you can :) ...

## How to use this image

First of all, you need to install it

```bash
docker pull axltxl/m2bk
```

However, if you still want to build it from source, you can do like so:

```bash
git clone git@github.com:axltxl/docker-m2bk.git
cd m2bk
docker build -t axltxl/m2bk . 
```

Once you are done, you can proceed to execute a `m2bk` container

```bash
# Specify your m2bk configuration file via a -v mount
# Give m2bk a rsyslog socket in the same fashion
docker run --rm -v /dev/log:/dev/log -v /path/to/your/m2bk.yaml:/etc/m2bk.yaml  axltxl/m2bk -s
```
NOTE: since `m2bk` relies on `rsyslog` to output its log entries, it is still necessary to pass a proper `rsyslog` UNIX socket for the container to work (`/dev/log`). 

##Copyright and Licensing
Copyright (c) 2015 Alejandro Ricoveri

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
