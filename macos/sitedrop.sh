#!/bin/bash

HOME_USER=jonathanbossenger

SITE_NAME=$1

SSL_CERTS_DIRECTORY=/Users/$HOME_USER/ssl-certs
SITES_DIRECTORY=/Users/$HOME_USER/development/websites

echo "Deleting certs.."

rm -rf $SSL_CERTS_DIRECTORY/"$SITE_NAME"*

echo "Remove hosts record.."

sed -i "/$SITE_NAME.test/d" /etc/hosts

echo "Removing websites directory..."

rm -rf $SITES_DIRECTORY/"$SITE_NAME"

echo "Removing site from Multipass VM..."

multipass exec triangle sudo sitedrop $SITE_NAME

echo "Done!"