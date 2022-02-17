#!/usr/bin/env bash

ufw-docker delete allow swag 80/tcp
ufw-docker delete allow swag 443/tcp
ufw-docker delete allow transmission 51413/tcp
ufw-docker delete allow transmission 51413/udp

ufw-docker allow swag 80/tcp
ufw-docker allow swag 443/tcp
ufw-docker allow transmission 51413/tcp
ufw-docker allow transmission 51413/udp

ufw reload

