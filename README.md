# README

[![Build Status](https://travis-ci.org/mikey2020/ride-sharing-app.svg?branch=develop)](https://travis-ci.org/mikey2020/ride-sharing-app) [![Coverage Status](https://coveralls.io/repos/github/mikey2020/ride-sharing-app/badge.svg?branch=develop)](https://coveralls.io/github/mikey2020/ride-sharing-app?branch=develop)

Ride Sharing Application

## Ruby version
 - Ruby 2.4.1

## System dependencies(Gems)
 * [Ruby:](https://www.ruby-lang.org/en/) Ruby is a dynamic, open source programming language with a focus on simplicity and productivity. It has an elegant syntax that is natural to read and easy to write.
 * [Rails:](https://rubyonrails.org//)
 * [Dotenv:](https://github.com/bkeepers/dotenv) Shim to load environment variables from .env into ENV in development.
 * [Pg:](https://rubygems.org/gems/pg/versions/0.18.4) Pg is the Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]
 
## Installation or Configuration
- Clone this repository to have the app on your machine with ```git clone https://github.com/mikey2020/ride-sharing-app.git```
- Change directory to the app's root with ```cd ride-sharing-app```
- Pull the development branch with ```git pull origin develop```
- Then run ```bundle install```  to install the dependencies.
- Run ```rails db:migrate``` to migrate database tables.
- Run ```rails db:seed``` to seed database tables.
- Start the server with ```rails s```
- Then visit ```http://localhost:3000``` to view the app.
- Run ```bundle exec rspec spec``` to run tests.

## User functions
- You can post a ride request or offer.
- You can edit a previously posted ride.
- You can delete a request or offer. 
- You can cancel your interest in a ride.

## How to Contribute
- Fork this repository.
- Clone it.
- Create your feature branch on your local machine with ```git checkout -b your-feature-branch```
- Push your changes to your remote branch with ```git push origin your-feature-branch```
- Open a pull request to the master branch, and describe how your feature works

### Author
Michael Eboagu
