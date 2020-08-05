#!/bin/bash

exec docker-compose exec pgsql /backup/backup.sh

