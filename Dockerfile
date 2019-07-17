FROM python:3-alpine

ENV INFLUX_HOST=influxdb
ENV INFLUX_PORT=8086
ENV CONTROLLER_URI=https://unifi:8443
ENV CONTROLLER_USERNAME=admin
ENV CONTROLLER_PASSWORD=password
ENV CONTROLLER_VERIFY=false
ENV INFLUX_DEFAULTTAGS=
ENV CONTROLLER_SITE=default

COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt && pip install influxdb
CMD [ "python", "./influx.py" ]
