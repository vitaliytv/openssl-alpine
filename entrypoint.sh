#!/bin/sh
# docker entrypoint script

openssl req \
  -x509 \
  -nodes \
  -days "$DAYS" \
  -newkey rsa:2048 \ 
  -keyout "$ISSUER_NAME.key" \ 
  -out "$ISSUER_NAME.crt" \
  -subj "/C=$COUNTY/ST=$STATE/L=$LOCATION/O=$ORGANISATION/CN=$ISSUER_CN"

  # copy certificate to volume
  cp "$ISSUER_NAME.crt" "$CERT_DIR"
  cp "$ISSUER_NAME.key" "$CERT_DIR"  

# run command passed to docker run
exec "$@"
