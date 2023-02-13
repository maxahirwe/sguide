# Study Guide

## Description

Sguide: "Study Guide - A Personal AI-Assisted Study Assistant"

Objective: To create a web application that uses the OpenAI API to provide students with a personal study assistant that can answer their questions and provide additional resources to help them study more effectively.

### Features

Question Answering: Students can ask any questions related to their coursework and receive accurate answers in real-time.

Study Tips: Students can request study tips and receive suggestions on how to study more effectively.

Resource Recommendation: Students can ask for resources related to a specific topic, and the application will provide them with links to articles, videos, and other materials that may be helpful.

Homework Help: Students can ask for help with their homework, and the application will provide step-by-step solutions and explanations.

Personalized Feedback: The application will provide personalized feedback to students based on their progress and performance, and offer suggestions on how they can improve.

### Technologies Used:

-   OpenAI API
-   Ruby on Rails 6
-   Ruby version 2.7
-   ERB HTML, CSS, and JavaScript (front-end development)
-   Database: Development:sqlite | Production:postgresql
-   Docker

### How it Works:

The student visits the "Study Guide(Sguide)" website and logs in.
The student asks a question or requests a resource.
The web application sends the student's request to the OpenAI API for processing.
The OpenAI API returns the answer or resource to the web application.
The web application displays the answer or resource to the student.
This web application provides students with a convenient and effective way to study and improve their grades. By leveraging the power of the OpenAI API, the application can provide personalized and accurate answers and resources in real-time, helping students achieve their academic goals.

## Installation steps

    - install [docker](https://docs.docker.com/engine/)
    - install docker [compose plugin] (https://docs.docker.com/compose/install/linux/)
    - CONFIGURE  "/config/local_env.yml" =>  REPLACE 'KEY' WITH PROVIDED API KEY

### Local

```
	npm install --global yarn (if necessary)
	npm install
	bundle install
	rails webpacker:install (if necessary)
```

if you want to run in local environment

```
	rails db:migrate
	rails s
```

### Docker/Deployment

```
	docker build -t sguide .
	docker-compose up
	visit http://localhost:3000/
```

### Sample Screenshots

-   ![Screenshot1.png](/documentation/screenshots/screenshot1.png)
-   ![Screenshot2.png](/documentation/screenshots/screenshot2.png)
-   ![sguide.png](/documentation/screenshots/sguide.gif)

## Author

[@maxahirwe](https://max.rw)
