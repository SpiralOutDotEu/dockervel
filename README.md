#Dockervel
##A complete Laravel development environment in Docker Containers:

###Bring Up a Laravel development environment with a single command easy as `dup`
###Execute Artisan commands easy as  `dartisan make:auth`
###Run Composer command easy as `dcomposer update`
###Run NodeJS script easy as `dnodejs npm install`
###Run gulp watch easy as `dgulp-watch`
###Containers managed with docker-compose
###Lightweight as it is mostly based in Linux Alpine base image of 5MB.

###Containers included 
* Nginx 1.8.0 & PHP 5.6 running in Alpine
* MariaDB 5.5 running in Alpine
* Redis running in Alpine
* Composer PHP running in Alpine.
* Artisan running in Debian (alpine is missing some PHP packages) 
* NodeJS with gulp, grunt and bower -g installed in official node:4.2.2-slim base image
* Volumes mounted as containers 


## Usage

* clone this repo: `git clone https://github.com/dydx/alpine-nginx-php-mariadb`
* cd in: `cd dockervel`
* add aliases: `. ./aliases.sh`
* run: `dup`
and you have a server running!
### aliases
aliases.sh contains shortcuts to common commands. 
run dot space dot /aliashes.sh to activate aliases for this terminal session.
```
$ . ./aliases.sh
```
and now for this terminal session you have aliases like `dartisan`, `dcomposer`, `dnodejs`, `dup`, `dstop`. 

If you don't want to work with aliases, open the script and see the coressponding commands next to each alias.
In the following document it is supposed that you have executed aliashes.sh and you have the aliases active. 


* create new laravel project: `dcomposer-create`
* type `localhost` in your browser and you see the Laravel welcome screen

### fix permitions
since containers have different user in them, you have to change the permisions in www/ folder to be able to write. type:
```
$ dpermit
```
it will simply `chmod -R 777 www`
Remember to run `dpermit` after each time the `www` folder has a new file.

### configure laravel for mysql
change `DB_HOST` in `.env` to point to `mysql`. This is the name that it is used in docker-compose.yml (`link: -mysql:mysql`)
```
DB_HOST=mysql
DB_DATABASE=homestead
DB_USERNAME=homestead
DB_PASSWORD=secret
```
### Configure laravel for redis
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

### Configure Laravel's cache and session with redis
Change in `.env` from `file` to `redis` 
```
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_DRIVER=sync
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
### nodejs
to install node modules in your project run
```
$ dnodejs npm install
```

### gulp
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

## size

* front: 70.05 MB
* mysql: 199.5 MB


