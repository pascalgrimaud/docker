#!/bin/sh

docker run -d -p 5432:5432 -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo --name db -v ~/volumes/odoo/postgresql/:/var/lib/postgresql/ postgres
