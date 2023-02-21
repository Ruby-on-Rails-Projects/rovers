
## Rover Project

Clone the project

```bash
  git clone https://gitlab.com/leandro-santana/rovers.git
  git branch featuare/rovers
```

Let's go up docker, keep in mind that you need docker and docker-compose in your machine, for more information access the links bellow:

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04


```bash
  cd rovers
  docker-compose up
```

Just in case you want to run tests You'll have to run the commands bellow.

```bash
  docker exec -it web rspec spec --format documentation --format progress
```

You can acces the project on browser with the link bellow, you'll see the swagger page with the route and examples for run rovers

```bash
  http://127.0.0.1:3000
```

