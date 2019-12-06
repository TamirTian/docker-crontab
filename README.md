# docker-crontab
```
 docker run -e COMMAND='echo hellow world' -e CRONTAB='*/1 * * * * *' 94tamir/crontab
```

```
 docker run -e COMMAND='curl -m 5 www.google.com' -e CRONTAB='*/10 * * * * *' 94tamir/crontab
```
 
