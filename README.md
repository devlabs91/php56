Php56
=====

Docker image with Apache and Php56.

Usage
-----

Example

Create folders, and file with content:

images/web/index.php

    <?php phpinfo();

images/web/Dockerfile
    
    FROM devlabs91/php56
    ADD index.php /var/www/html/index.php


Create a docker-compose.yml file :

    version: "2"
    services:
    
        web:
            build: ./images/web
            image: images/web
            container_name: web
            restart: always
    
            volumes:
                - web-vol:/var/www/html
                - ./volumes:/mnt/volumes
            ports:
                - '80:80'
                - '443:443'
                - '2222:22'
            dns:
                - 1.1.1.1
    volumes:
        web-vol:


Build

    docker-compose build
    
    docker images -a

        REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
        devlabs91/php56     latest              1ed9d0ced0b0        23 minutes ago      409MB
        images/web          latest              1ed9d0ced0b0        23 minutes ago      409MB

Start & Access

    docker-compose up -d

        Creating network "demo_default" with the default driver
        Creating volume "demo_web-vol" with default driver
        Creating web ... done

    docker exec -it web bash

        bash-4.2#

    https://{IP_OF_YOUR_DOCKER_MACHINE}/

        You should see the index.php file.

Information on build
--------------------

Example of docker-compose.yml

    version: "2"
    services:
    
        web:
            build: ./php56
            image: dl/web
            container_name: web
            restart: always
    
            volumes:
                - web-vol:/var/www/html
                - ./volumes:/mnt/volumes
            ports:
                - '80:80'
                - '443:443'
                - '2222:22'
            dns:
                - 1.1.1.1
    volumes:
        web-vol:


Build

    docker-compose build
    docker-compose up -d
    
Accessing the image

    docker images -a

    docker exec -it web bash

Removing images

    docker-compose down
    docker system prune -a

Documentation
-------------

About
-----

Created by DevLabs91.
