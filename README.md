#Dockervel
##A complete Laravel development environment in Docker Containers:

* Bring Up a Laravel development environment with a single command easy as `dup`
* Execute Artisan commands easy as  `dartisan make:auth`
* Run Composer command easy as `dcomposer update`
* Run NodeJS script easy as `dnodejs npm install`
* Run gulp watch easy as `dgulp-watch`
* Containers managed with docker-compose
* Lightweight as it is mostly based in Linux Alpine base image of 5MB.
* Using Docker-composer version 2 (new)

###Containers included 
* Nginx 1.8.0 & PHP 5.6 running in Alpine
* MariaDB 5.5 running in Alpine
* Redis running in Alpine
* Composer PHP running in Alpine.
* Artisan running in Debian (alpine is missing some PHP packages) 
* NodeJS with gulp, grunt and bower -g installed in official node:4.2.2-slim base image
* Volumes mounted as containers 


## Usage

Make sure you have `docker` `docker-machine` and `docker-compose` installed. See [here for installing them](http://www.spiralout.eu/2015/12/docker-installation-in-linux-mint-and.html)

* clone this repo: `git clone https://github.com/SpiralOutDotEu/dockervel.git`
* cd in: `cd dockervel`
* run as su: `sudo su`
* add aliases: `. ./aliases.sh`
* run: `dup` 
and you have a server running! Hit `localhost` in your browser and you will see nginx fault message becasuse there is no `www/public/index.php`.
* create new Laravel project: `dcomposer-create`
* fix permissions: `dpermit`
* change .env: [see below for options](https://github.com/SpiralOutDotEu/dockervel/blob/master/README.md#configure-laravel-for-mysql)
* run artisan commands: `dartisan make:auth` , `dartisan migrate`
* fix permissions: `dpermit`
Now you have a registration system active. Go to `localhost` and register a new user to see that db's are running ok.
* npm install: `dnodejs npm install`
* gulp install: `dnodejs gulp install`
* gulp watch: `dulp-watch`
Now there is one container running `gulp watch` and monitors changes on files according your `gulpfile.js`  


## aliases
aliases.sh contains shortcuts to common commands. 
run dot space dot /aliases.sh to activate aliases for this terminal session.
```
$ . ./aliases.sh
```
and now for this terminal session you have aliases like `dartisan`, `dcomposer`, `dnodejs`, `dup`, `dstop`. 

If you don't want to work with aliases, open the script and see the coressponding commands next to each alias.
In the following document it is supposed that you have executed `aliashes.sh` as `su` and you have the aliases active. 

### Create new Laravel Project
* create new laravel project: `dcomposer-create`
* type `localhost` in your browser and you see the Laravel welcome screen

### Fix permitions
since containers have different user in them, you have to change the permisions in www/ folder to be able to write. type:
```
$ dpermit
```
it will simply `chmod -R 777 www`
Remember to run `dpermit` after each time the `www` folder has a new file.

### Configure Laravel for mysql
change `DB_HOST` in `.env` to point to `mysql`. This is the name that it is used in docker-compose.yml (`link: -mysql:mysql`)
```
DB_HOST=mysql
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```
### Configure Laravel for redis
change `REDIS_HOST` in `.env` to point to `predis`. This is the name that it is used in docker-compose.yml (`link: -redis:predis`).
```
REDIS_HOST=predis
REDIS_PASSWORD=null
REDIS_PORT=6379

```
in Laravel 5.2 there are some issues with `redis` namespace, so to avoid conflicts `predis` is used.
Also you have to change /config/app.php, and replace:
```
'Redis'     => Illuminate\Support\Facades\Redis::class,
```
with
```
'LaravelRedis'     => Illuminate\Support\Facades\Redis::class,
```
Use it like:
```
$redis= LaravelRedis::connection();
$redis->set('name', 'myname');
$redis->get('name'); 
```

### Running Artisan commands
type `dartisan ` followed by an artisan command
```
example:
$ dartisan make:auth
$ dartisan migrate
$ dartisan tinker
```
### Running composer commands
type `dcomposer ` followed by a composer command
```
example:
$ dcomposer update
$ dcomposer require predis/predis
```
### Nodejs
to install node modules in your project run
```
$ dnodejs npm install
```

### Gulp
install gulp with:
```
dnodejs gulp install:
```

run gulp once:
```
dgulp
```

add gulp watch:
```
dgulp-watch
```

## Size

The size of images is about 750 MB:
```
* front:     70.05 MB
* mysql:    199.50 MB
* redis:      8.50 MB
* composer: 236.80 MB
* nodejs:    36.09 MB
* artisan   208.80 MB
```
The base memory usage for the containers of the server running is about 110 MB.
```
* front: 18 MB
* mysql: 97 MB
* redis:  1 MB
```

## Credits
Thanx to:
* [Josh Sandlin](https://github.com/dydx)
* [Dylan Lindgren](https://github.com/dylanlindgren)
* [10Startups](https://github.com/tenstartups)
* [Tom Sowerby](https://medium.com/@tomsowerby)





