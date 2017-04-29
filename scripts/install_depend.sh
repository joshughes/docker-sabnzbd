#!/bin/ash
set -ex

cd /src || exit 1

git clone https://github.com/jkansanen/par2cmdline-mt.git

cd par2cmdline-mt || exit 1

aclocal
automake --add-missing
autoconf
./configure
make
make install

cd /src

rm -rf /src/par2cmdline-mt

python /scripts/get_pip.py

pip install sabyenc --upgrade

pip install\
      cherrypy\
      Cheetah\
      pyOpenSSL

rm /scripts/get_pip.py

mkdir -p /config /data

exit 0
