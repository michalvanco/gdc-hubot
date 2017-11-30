FROM node:8.2.1

LABEL name="GoodData Hubot" \
      maintainer="SETI <seti@gooddata.com>" \
      license="ALv2"

# run as root
RUN apt-get update && \
  apt-get install jq && \
  rm -f /var/cache/apk/* && \
  npm install -g yo generator-hubot


RUN useradd -d /gdc-hubot -m -s /bin/bash -U gdc-hubot

# run as hubot - https://github.com/yeoman/yeoman.github.io/issues/282
USER gdc-hubot
WORKDIR /gdc-hubot

# install npms
RUN yo hubot --owner="SETI" --name="@CIBot" \
    --description="GD hubot" --defaults

RUN npm install --save hubot-hipchat

ADD install-npm.sh /gdc-hubot/install-npm.sh
ADD external-scripts.json /gdc-hubot/external-scripts.json
RUN /gdc-hubot/install-npm.sh

COPY get-k8s-vault-secret.sh /gdc-hubot/get-k8s-vault-secret.sh
COPY run.sh /gdc-hubot/run.sh

ENTRYPOINT "/gdc-hubot/run.sh"
