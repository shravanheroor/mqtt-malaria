Using malaria to load test:

1. Clone this repository
2. Build the docker image 
```
docker build mqtt-malaria .
```
3. Start the subscriber:
```
docker run -v ~/Sources/awsiot-certs:/root/certs -ti mqtt-malaria malaria subscribe 
-N 8 -n 10000 -H iot-test.partner.netflix.net -p 8883 -q 1 
--ca_certs /root/certs/aws-prod/digicert.pem 
--certfile /root/certs/superuser-cert-test/505dfd936b-certificate.pem.crt 
--keyfile /root/certs/superuser-cert-test/505dfd936b-private.pem.key

will start a subscriber listening to 8 clients of 10000 messages
```

4. start publisher:
```
docker run -v ~/Sources/awsiot-certs:/root/certs -ti mqtt-malaria malaria publish 
-P 8 -n 10000 -H iot-test.partner.netflix.net -p 8883 -s 100 -q 1 -t 
--ca_certs /root/certs/aws-prod/digicert.pem 
--certfile /root/certs/superuser-cert-test/505dfd936b-certificate.pem.crt 
--keyfile /root/certs/superuser-cert-test/505dfd936b-private.pem.key

will start a publisher with 8 processes of 10000 messages
```