# Study Guide

## Description

Title: "Study Buddy - A Personal Study Assistant"

Objective: To create a web application that uses the OpenAI API to provide students with a personal study assistant that can answer their questions and provide additional resources to help them study more effectively.

### Features

Question Answering: Students can ask any questions related to their coursework and receive accurate answers in real-time.

Study Tips: Students can request study tips and receive suggestions on how to study more effectively.

Resource Recommendation: Students can ask for resources related to a specific topic, and the application will provide them with links to articles, videos, and other materials that may be helpful.

Homework Help: Students can ask for help with their homework, and the application will provide step-by-step solutions and explanations.

Personalized Feedback: The application will provide personalized feedback to students based on their progress and performance, and offer suggestions on how they can improve.

### Technologies Used:

-   OpenAI API
-   Ruby on Rails 6 (for building the web application)
-   ERB HTML, CSS, and JavaScript (for front-end development)

### How it Works:

The student visits the "Study Buddy" website and logs in.
The student asks a question or requests a resource.
The web application sends the student's request to the OpenAI API for processing.
The OpenAI API returns the answer or resource to the web application.
The web application displays the answer or resource to the student.
This web application provides students with a convenient and effective way to study and improve their grades. By leveraging the power of the OpenAI API, the application can provide personalized and accurate answers and resources in real-time, helping students achieve their academic goals.

### Tech

-   Ruby version 2.7

-   Database POSTGRSQL

# Installation steps

if you want to run in local environment
npm install --global yarn
rails webpacker:install
docker build -t sguide .
docker-compose up
