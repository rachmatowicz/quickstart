#!/bin/sh
# script for re-generating the keystores and truststores needed for SSL connector
# server passwords: tlsServerKeypass, tlsServerTrustpass
# client password: tlsClientKeypass, tlsClientTrustpass

# Create server keystore - file server.keystore
keytool -genkey -v -alias serveralias -keyalg RSA -keysize 2048 -keystore server.keystore -validity 3650 -keypass tlsServerKeypass -storepass tlsServerStorepass -dname "cn=Server Administrator,o=Acme,c=GB"

# Export Server's Public Key - file server.cer
keytool -export -keystore server.keystore -alias serveralias -file server.cer -keypass tlsServerKeypass -storepass tlsServerStorepass

# Create Client Key Store - file client.keystore
keytool -genkey -v -alias clientalias -keyalg RSA -keysize 2048 -keystore client.keystore -validity 3650 -keypass tlsClientKeypass -storepass tlsClientStorepass -dname "cn=Client Administrator,o=Acme,c=GB"

# Exporting Client's Public Key - file client.cer
keytool -export -keystore client.keystore -alias clientalias -file client.cer -keypass tlsClientKeypass -storepass tlsClientStorepass

# Importing Client's Public key into server's truststore
keytool -import -v -trustcacerts -alias clientalias -file client.cer -keystore server.truststore -keypass tlsServerKeypass -storepass tlsServerStorepass

# Importing Server's Public key into client's truststore
keytool -import -v -trustcacerts -alias serveralias -file server.cer -keystore client.truststore -keypass tlsClientKeypass -storepass tlsClientStorepass
