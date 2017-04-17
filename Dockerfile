FROM nimbix/ubuntu-desktop:trusty
MAINTAINER stephen.fox@nimbix.net

RUN apt-get update && apt-get install -y curl

# Add PushToCompute Work Flow Metadata
ADD ./NAE/nvidia.cfg /etc/NAE/nvidia.cfg
ADD ./NAE/AppDef.png /etc/NAE/AppDef.png
ADD ./NAE/AppDef.json /etc/NAE/AppDef.json
COPY ./NAE/screenshot.png /etc/NAE/screenshot.png

#validation
RUN curl --fail "https://api.jarvice.com/jarvice/validate" -d@/etc/NAE/AppDef.json

