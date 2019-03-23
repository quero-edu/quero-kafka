# Requirements
Docker and docker-compose installed on your machine.

# About
This script prepares a local environment for running Kafka. The docker-compose file contains all the required 
dependencies for running Kafka locally. In addition, the setup:

  - Install [kafkacat](https://github.com/edenhill/kafkacat), a command-line utility for accessing Kafka topics.  
  - Configure a startup script, so you can easily start Kafka from any path on your system. 

# Installing
To install this Kafka, just run:

``` 
wget https://github.com/quero-edu/quero-kafka/setup.sh | sudo bash -s
```

# Using Kafka locally
To start Kafka environment (Kafka + ZooKeeper), just run from any path:
```
kafka-up
``` 
