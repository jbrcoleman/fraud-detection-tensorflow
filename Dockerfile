# Download the TensorFlow Serving Docker image and repo
FROM tensorflow/serving

COPY  models/serving /models/fraud_classifier

