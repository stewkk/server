#!/usr/bin/env bash

/usr/local/bin/ufw-docker delete allow swag 80/tcp
/usr/local/bin/ufw-docker delete allow swag 443/tcp
/usr/local/bin/ufw-docker delete allow transmission 51413/tcp
/usr/local/bin/ufw-docker delete allow transmission 51413/udp
/usr/local/bin/ufw-docker delete allow gitea 222

/usr/local/bin/ufw-docker allow swag 80/tcp
/usr/local/bin/ufw-docker allow swag 443/tcp
/usr/local/bin/ufw-docker allow transmission 51413/tcp
/usr/local/bin/ufw-docker allow transmission 51413/udp
/usr/local/bin/ufw-docker allow gitea 222

/usr/sbin/ufw reload

