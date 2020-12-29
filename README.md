docker-ebot
================
Dockerised eBot (https://github.com/deStrO/eBot-CSGO) for ease of use. 
--------------

Settings
---------
* Edit app.yml and app_user.yml located in config folder as per your needs.
* Edit "ServerAdmin" in 000-default.conf.(Optional)
---------
Edit the following settings in [docker-compose.yml](docker-compose.yml) to your needs.
#### eBot-Web
````
    ports:
    - "8000:80"
    EBOT_ADMIN_USER: 'admin'
    EBOT_ADMIN_PASS: 'password'
    EBOT_ADMIN_MAIL: 'admin@ebot'
    MYSQL_HOST: '10.20.30.23'
    MYSQL_PORT: '3306'
    MYSQL_DB: 'ebot'
    MYSQL_USER: 'root'
    MYSQL_PASS: 'password'
````
* Upload files to your server.
---

Run
---

`docker-compose up -d`

Quick start
-----------
* Connect to the running eBot web interface @ `http://$hostip:port/`

* To admin goto `http://$hostip:port/admin.php`


Credits
-------
* jeff
* carazzim0
* destr0


Note
-------
* Note: This script only works if you have external mysql server.
