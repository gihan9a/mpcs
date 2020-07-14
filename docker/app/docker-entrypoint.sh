#!/bin/bash
# variables
DATA_DIR=/var/www/html

# Fix user permission on mounted volumes
find "$DATA_DIR" \! -user www-data -exec chown www-data '{}' +

# Finally start the apache httpd in foreground mode
/usr/sbin/apache2ctl -D FOREGROUND