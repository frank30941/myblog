# myblog

``` shell
docker run --rm --name=blog -p 80:80 frank30941/myblog

docker exec -it blog sh
-> cd /usr/share/nginx/html/;
-> hugo new site blog;
-> hugo new about/index.md;
```
