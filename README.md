# Flask Docker Application

## Overview

This repository contains a sample web application built using Flask and deployed in a Docker container.

## Application Functionality

The application is a simple Flask web server that displays " " when accessed at the root URL.

## Steps to Deploy

1. **Set Up a Project Directory**
   Create a new directory for your project and navigate into it.

2. **Create a Flask Application**
   Add `app.py` to define a simple Flask app.

3. **Create a Requirements File**
   Add `requirements.txt` to list the required Python packages. `Flask` Module has been used in this case.

4. **Create a Dockerfile**
   Write a `Dockerfile` to build an image for the Flask application.

5. **Build the Docker Image**
   Run `docker build -t app .` to build the image.

6. **Run the Docker Container**
   Start the container with `docker run -p 5000:5000 app`.

## Author

-**Name**: 

-**Roll Number**: 


