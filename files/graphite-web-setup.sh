#!/bin/bash
/usr/bin/graphite-build-index 2>&1
/usr/bin/graphite-manage syncdb --noinput 2>&1
touch /var/lib/graphite-web/provisioned
