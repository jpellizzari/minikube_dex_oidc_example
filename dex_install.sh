#!/bin/sh

kubectl create namespace dex

kubectl -n dex create secret tls dex.dex.tls --cert=ssl/cert.pem --key=ssl/key.pem

kubectl -n dex create secret \
    generic github-client \
    --from-literal=client-id=$GITHUB_CLIENT_ID \
    --from-literal=client-secret=$GITHUB_CLIENT_SECRET

kubectl create -f dex.yaml


