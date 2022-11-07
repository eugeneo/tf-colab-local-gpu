FROM tensorflow/tensorflow:latest-gpu

RUN [ "/usr/bin/python3", "-m", "pip", "install", "--upgrade", "pip" ]
RUN [ "/usr/bin/python3", "-m", "pip", "install", "jupyter" ]
RUN [ "/usr/bin/python3", "-m", "pip", "install", "jupyter_http_over_ws" ]

RUN adduser --disabled-password --gecos '' --uid 1000 colab

USER colab

WORKDIR /home/colab

EXPOSE 8888

RUN ["jupyter", "serverextension", "enable", "--py", "jupyter_http_over_ws"]

CMD ["jupyter", "notebook", \
    "--NotebookApp.allow_origin='https://colab.research.google.com'", \
    "--no-browser", "--port=8888", "--NotebookApp.port_retries=0", \
    "--ip=0.0.0.0"]
