FROM node:8.2.1

LABEL name="GoodData Hubot" \
      maintainer="Pavol Gressa <pavol.gressa@gooddata.com>" \
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
RUN yo hubot --owner="Pavol Gressa" --name="PavolGressa" \
    --description="GD hubot" --defaults

RUN npm install --save hubot-hipchat

ADD install-npm.sh /gdc-hubot/install-npm.sh
ADD external-scripts.json /gdc-hubot/external-scripts.json
RUN /gdc-hubot/install-npm.sh


ENTRYPOINT ["/bin/bash"]
