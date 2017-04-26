# OpenSSL Alpine

## Verify certificate

Run docker container then view the generated public certificate:

```
make verify
```

## Customisation

Override the following environment variables when running the docker container to customise the generated certificate:

| VARIABLE | DESCRIPTION | DEFAULT |
| :------- | :---------- | :------ |
| COUNTY | Certificate subject country string | UK |
| STATE | Certificate subject state string | Greater London |
| LOCATION | Certificate subject location string | London |
| ORGANISATION | Certificate subject organisation string | Example |
| ROOT_CN | Root certificate common name | Root |
| ISSUER_CN | Intermediate issuer certificate common name | Example Ltd |
| PUBLIC_CN | Public certificate common name | *.example.com |
| ROOT_NAME | Root certificate filename | root |
| ISSUER_NAME | Intermediate issuer certificate filename | example |
| PUBLIC_NAME | Public certificate filename | public |
| RSA_KEY_NUMBITS | The size of the rsa keys to generate in bits | 2048 |
| DAYS | The number of days to certify the certificates for | 365 |

For example:

```
docker run \
  -e COUNTY="ME" \
  -e STATE="Middle Earth" \
  -e LOCATION="The Shire" \
  -e ORGANISATION="Hobbit" \
  -e ISSUER_CN="J R R Tolkien" \
  -e PUBLIC_CN="hobbit.com" \
  -e ISSUER_NAME="tolkien" \
  -e PUBLIC_NAME="hobbit" \
  -v hobbit:/etc/ssl/certs \
  pgarrett/openssl-alpine
```

List the generated certificates:

```
ls -la /var/lib/docker/volumes/hobbit/_data
```

View the public certificate details:

```
openssl x509 -in /var/lib/docker/volumes/hobbit/_data/hobbit.crt -text -noout
```
