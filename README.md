# Volunteer Tracker
#### By Michael Reiersgaard

## Technologies Used

* Ruby
* PostgreSQL
* Bundler
* RSpec
* Pry
* Sinatra
* Capybara

## Description
A one-day project to create a web portal for a volunteer organization to manage projects and volunteers in a one-to-many relationship. Expanded beyond the original requirements to add hour tracking, leaderboards, Bootstrap, auto-populated dropdowns, and more.


## Setup/Installation Requirements

### Intial project setup

* Ruby is required, download and install https://www.ruby-lang.org/en/documentation/installation/
* Bundler is required, install using the terminal with `gem install bundler`
* Install all dependencies with `bundle install`
* Create and enter a directory on your local machine for the project
* Clone public repository from GitHub using `git clone https://github.com/mireie/volunteer_tracker`

### PostreSQL setup
* Ensure PostgreSQL is installed and correctly running on your local machine
* To load the existing database run the following from the terminal in the root directory of the project:
```
createdb volunteer_tracker
psql volunteer_tracker < database_backup.sql
createdb -T volunteer_tracker volunteer_tracker_test;
```

### Running tests
* To run tests, in the terminal run `rspec`
* To run the site on your local machine in the terminal run `ruby app.rb`


## Links
- [GitHub Repo](https://github.com/mireie/volunteer_tracker)

## Known Bugs

* 100% coverage for integration testing is only for required functionality

## License

[MIT](https://en.wikipedia.org/wiki/MIT_License)

Copyright (c) 2021 Michael Reiersgaard

## Contact Information

Michael Reiersgaard michael.reiersgaard [at] gmail.com