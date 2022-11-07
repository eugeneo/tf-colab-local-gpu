# tf-colab-local-gpu

A Docker image for running local TensorFlow instance on Google Colab with GPU
support. No need to figure out all those dependencies.

## Usage

I run it on WSL2, but it should work on any Linux machine. Build by running:
```
docker build -t tf-colab-local-gpu .
```

Then run it with:
```
docker run --gpus all -u $(id -u):$(id -g) -it --rm -p 8888:8888 tf-colab-local-gpu
```

(I update instructions with mounting the directory, but I don't use it)


It will print a link to the Jupyter notebook, something like this:
```
http://d1af4f9a601c:8888/?token=...
```

Replace the Docker container ID with `localhost` and paste it into the Colab.

## TODO

1. Publish on Docker Hub
2. Continuous build
3. Fix the printed link, if possible.

I may also install extra PIP packages and such as I am learning Keras and
TensorFlow.