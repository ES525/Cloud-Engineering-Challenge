#!/bin/bash
mkdir -p certs
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout certs/server.key -out certs/server.crt \
-subj "/C=US/ST=NJ/L=Newark/O=NucleusChallenge/CN=localhost"

echo "Certificates generated in ./certs"