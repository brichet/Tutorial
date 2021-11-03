# Build and run docker container with Jupyter Notebook and all necessary kernels

```commandline
sudo docker build . -f Dockerfile -t jupyter_crop2ml
sudo docker run -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes jupyter_crop2ml
```

Then go to http://127.0.0.1:8888/lab and copy and paste the token (or ctrl + click on the link in terminal).
