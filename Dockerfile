FROM node:8.2.1

LABEL name="GoodData Hubot" \
      maintainer="Pavol Gressa <pavol.gressa@gooddata.com>" \
      license="ALv2"

# run as root
RUN apt-get update && \
  apt-get install jq
  rm -f /var/cache/apk/* && \
  npm install -g yo generator-hubot && \

RUN useradd -d /gdc-hubot -m -s /bin/bash -U gdc-hubot

# run as hubot - https://github.com/yeoman/yeoman.github.io/issues/282
USER hubot
WORKDIR /gdc-hubot

# install npms
ADD install-npm.sh /gdc-hubot/install-npm.sh
ADD external-scripts.json /gdc-hubot/external-script.json
RUN ./install-npm.sh

#RUN yo hubot --owner="Pavol Gressa" --name="hubot" \
    --description="GD hubot" --defaults \
    --adapter=hipchat



#ENTRYPOINT ["/bin/bash"]
