# Requirements
Docker and docker-compose installed on your machine.

# About
This script prepares a local environment for running Kafka. The docker-compose file contains all the required 
dependencies for running Kafka locally. In addition, the setup:

  - Install [kafkacat](https://github.com/edenhill/kafkacat), a command-line utility for accessing Kafka topics.  
  - Configure a startup script, so you can easily start Kafka from any path on your system. 

# Installing
To install the environment, just run:

``` 
curl -s https://raw.githubusercontent.com/quero-edu/quero-kafka/master/setup.sh | bash -s
```

**NOTE**: you don't need to clone this repo!

# Running
To start the Kafka environment (Kafka + ZooKeeper), just run it from any path:
```
kafkaup
``` 
**NOTE**: if you use other shells besides bash (zsh, for example), you will need to start another shell to be able to run `kafkaup`.
