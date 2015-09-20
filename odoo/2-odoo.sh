#!/bin/sh

docker run -d -p 127.0.0.1:8069:8069 --name odoo --link db:db -t odoo
