FROM chartmuseum/chartmuseum
USER root
RUN apk add --no-cache bash
RUN mkdir -p /opt/app
RUN chown -R chartmuseum:chartmuseum /opt
WORKDIR /opt/app
USER chartmuseum
COPY run.sh .
ENV GCLOUD_SERVICE_KEY=put_your_gcloud_service_key_here
ENV GCLOUD_BUCKET_NAME=chartmuseum
ENTRYPOINT ["/bin/bash"]
EXPOSE 8080
CMD ["/opt/app/run.sh"]
