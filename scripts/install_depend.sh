#!/bin/ash

cd /src || exit 1

git clone https://github.com/jkansanen/par2cmdline-mt.git
git checkout tags/v0.6.14-mt1

cd par2cmdline-mt || exit 1

aclocal
automake --add-missing
autoconf
./configure
make
make install

cd /src

rm -rf /src/par2cmdline

python /scripts/get_pip.py

pip install\
      cherrypy\
      Cheetah\
      pyOpenSSL

rm /scripts/get_pip.py

mkdir -p /config /data

exit 0
