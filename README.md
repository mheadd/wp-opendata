# WordPress Open Data Site
WordPress Docker image bundled with MySQL, the [WP OpenData plugin](https://wordpress.org/plugins/wp-opendata/) and [GovPress theme](http://www.govpress.co/). An easy way to get started using WordPress as a basic open data directory.

Note, this project is adapted from the [docker-wordpress-cli](https://github.com/KaiHofstetter/docker-wordpress-cli) project with some modifications and enhancements. Additional enhancement and improvements are in the works.

![WordPress for Open Data](https://raw.githubusercontent.com/mheadd/wp-opendata/master/wp-opendata.gif "WordPress for Open Data")

## How to use it

First, get [Docker](https://www.docker.com/). Then...

* Build the image

```
~$ docker build -t {user-name}/wordpress-opendata -f Dockerfile .
```

* Run WordPress

```
~$ docker run -e "WP_URL=http://{docker-ip}" -e "WP_PORT={docker-port}" --name wordpress-opendata -p {exposed-port}:80 -d {user-name}/wordpress-opendata 
```

* Access WordPress

```
http://{docker-ip}:{docker-port}
```

* Log in to WordPress

```
http://{docker-ip}:{docker-port}/wp-login.php
```

Default username: 'admin_user' (change this by using the environmental variables below)

Default password: 'secret' (change this by using the environmental variables below)

###  Environment variables
You can use the following environment variables to configure MySQL and WordPress

* **MYSQL_WP_USER** (default is 'WordPress')
  * MySQL user, used by WordPress
* **MYSQL_WP_PASSWORD** (default is 'secret')
  * MySQL password, used by WordPress
* **WP_URL** (default is 'localhost')
  * The address of the WordPress site.
* **WP_TITLE** (default is 'WordPress Open Data Demo')
  * Title of the WordPress blog
* **WP_ADMIN_USER** (default is 'admin_user')
  * WordPress admin user
* **WP_ADMIN_PASSWORD** (default is 'secret”)
  * WordPress admin password
* **WP_ADMIN_EMAIL** (default is 'test@test.com')
  * WordPress admin email address (Note - this WordPress installation will not send emails!)
* **APACHE_SERVERNAME** (default is localhost)
  * Sets the hostname and port that the server uses to identify itself
