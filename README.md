# fraud-detection-tensorflow
Serve a Tensoflow fraud detection model on GKE. The model aims to detects fraudlent transactions using a notebook on the tensorflow website that was used tocreate a fraud detector model and serve it using tensorflow serve on a Kubernetes cluster on GKE.

## Build Dockerfile and Push Image
Build the docker file by tagging it with the repo name that will be pushed to. 

`docker build -t us-central1-docker.pkg.dev/gothic-welder-398814/tf-serving:1.0.1 .`

`docker push us-central1-docker.pkg.dev/gothic-welder-398814/tf-serving/fraud-detector:1.0.0`

## Deployment
Apply terraform infrastucture for GCP
`terraform apply`

Apply Pod and Service

`kubectl apply -f fraud-app.yaml`

`kubectl apply -f fraud-service.yaml`

## Predict
Use the following command to get svc external ip 

`kubectl get svc`

Send prediction. For data section test data from notebook can be used for verification.

```
import json
import requests

data = json.dumps({"signature_name": "serving_default", "instances": <data>})
print('Data: {} ... {}'.format(data[:50], data[len(data)-52:]))


headers = {"content-type": "application/json"}
json_response = requests.post('http://<service_ip>:80/v1/models/fraud_classifier:predict', data=data, headers=headers)
```
