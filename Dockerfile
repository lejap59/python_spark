# install python in the container
FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-opencv git python3 python3-pip python3-venv

# copy the local requirements.txt file to the
# /app/requirements.txt in the container
# (the /app dir will be created)
# set the working directory in the container to be the /app
WORKDIR /app
COPY ./*.py .

# install flask
RUN pip3 install pyspark
RUN pip3 install flask

# expose the port 
EXPOSE 5000 

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
