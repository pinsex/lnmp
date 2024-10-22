#!/bin/bash
set -m && \
    lnmp start && \
    touch /opt/1.txt && \
    tail -f /opt/1.txt