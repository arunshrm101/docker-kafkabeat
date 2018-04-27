# docker-kafkabeat

```sh
Run Kafkabeat in Docker.
```

### Requirements
```sh
1.Need to run Zookeeper,Kafka and elasticsearch in the same container.
2.Put Dokerfile and kafkabeat.yml in same directory and Run following command
```
### Building on GCP
```sh
Change kafkabeat.yml file according to your kafka and elasticsearch is running.
```
```sh
docker build -t gcr.io/<Google Cloud Project name>/kafkabeat:1.0.0 .
  
-Pushing images to Container Registry  https://cloud.google.com/container-registry/docs/pushing-and-pulling

gcloud docker -- push gcr.io/<Google Cloud Project name>/kafkabeat:1.0.0  

-Run on K8s

kubectl run kafkabeat --image gcr.io/<Google Cloud Project name>/kafkabeat:1.0.0    
```


### other useful command

```sh
Check images
docker images
Remove one or more containers
docker rm $(docker ps -qa)
Remove one or more images
docker rmi $(docker images -q) --force

#...Run following command to test image is working locally...# 
Run zookeeper,kafka,elasticserach on host

change kafkabeat.yml file --> kafka broker to  localhost:9092 and output.elasticserach to localhost:9200

docker build -t kafkabeat:1.0.0 .
#If you specify the --net=host option to the docker run commands, Docker uses the host's network stack for the container.
docker run --net=host --name=kb kafkabeat:1.0.0
docker exec -it kb bash
```

