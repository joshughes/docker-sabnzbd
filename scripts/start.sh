#!/usr/local/bin/dumb-init /bin/ash

/src/SABnzbd-${SAB_VERSION}/SABnzbd.py --config-file /config --server :8080
