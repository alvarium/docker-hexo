Hexo docker image
=================

This image runs `npm install` + `hexo generate` and starts up an nginx server for
you.

You only need to run:

~~~bash
docker run -d --name my-hexo-site \
  -p 8080:80
  --volume $PWD:/app
  alvarium/hexo
~~~

License
-------

This docker container image [is licensed under a GNU GPL v.3 license][license].

[license]: ./LICENSE
