#!/bin/bash
cd /root/GitHub/core
node server.js -l 0.0.0.0 -p 3000 -a user:password -w /root/workspace
