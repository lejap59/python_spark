# install python in the container
# qui permet de configurer facilement un GPU
# lorsqu'il est de type nvidia
#FROM nvidia/cuda:10.2-devel-ubuntu18.04
FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-opencv git python3 python3-pip python3-venv

# copy the local requirements.txt file to the
# /app/requirements.txt in the container
# (the /app dir will be created)
##COPY ./requirements.txt /app/requirements.txt
COPY ./*.py /app/

# install the packages from the requirements.txt file in the container
#RUN python3 -m venv /opt/venv
#ENV PATH="/opt/venv/bin:$PATH"

#RUN pip3 install -r /app/requirements.txt
# expose the port that uvicorn will run the app
#EXPOSE 8000
# copy the local app/ folder to the /app folder in the container
# set the working directory in the container to be the /app
WORKDIR /app
#COPY --from=compiler /opt/venv /opt/venv
CMD ["python3","HelloWorld.py"]
