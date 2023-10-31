# Download the TensorFlow Serving Docker image and repo
FROM tensorflow/serving

# Set environment variables
ENV MODEL_NAME fraud_classifier
ENV model_base_path /models/fraud_classifier

# Expose the port on which the model will be served
EXPOSE 8501

COPY  models/serving /models/fraud_classifier

# Start TensorFlow Serving when the container runs
CMD tensorflow_model_server --port=8501 --model_name=$MODEL_NAME --model_base_path=$model_base_path
