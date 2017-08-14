# GDC hubot for hipchat


## How to build
```
docker build -t gdc-hubot:<tag> .
```

## How to run
```
docker run -e HUBOT_HIPCHAT_ROOMS="<room name | All - all is default>" -e HUBOT_HIPCHAT_PASSWORD=<pass for CIbot user> -e HUBOT_HIPCHAT_JID=<XXXX>@chat.hipchat.com gdc-hubot:<tag>
```

## How to debug
Start hubot image but with another env variable ```HUBOT_LOG_LEVEL=debug```
