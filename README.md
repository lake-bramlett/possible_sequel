# _Possible Sequel_


 _This game uses the movie database API called OMDB._

 **By _Nick Ramsey, Jacob Irwin, Abdellah Ramadan, Lake Bramlett, Daniel Hongel_**

## Description

_A web-based game created using OMDB, a movies api. It takes common links between movies or shows, such as the same actor or location, and puts it upon the user to create the best fictional story linking those two movies._

## Setup/Installation Requirements

 These instructions are aimed for MacOS, and may require slight adjustments if using another OS:
1. Clone this repository
2. Open terminal and type `git clone [git link]`
3. Navigate to project directory using `cd` in terminal
4. Open project in text editor (atom)
5. Type `bundle install` in terminal to load Gems
6. You will need to have PostgresQL installed and running
7. If you do not have Postgres running on your machine, please follow these steps:
 > - In another terminal tab, type $ `brew install postgres` (Mac OS)
 > - run $ `echo "export PGDATA=/usr/local/var/postgres" >> ~/.bash_profile`
 > - run $ `echo "export PGHOST=/tmp" >> ~/.bash_profile`
 > - run $ `source ~/.bash_profile`
 > - run $ `postgres` in order to start the postgres server
 > - If you encounter an error finding a user database, then run $ `createdb $USER`
8. In terminal, while in the root project directory, run $ `rails db:create`
9. To run tests, run $ `rspec` in terminal
10. To run the program, run $ `rails s` in terminal
11. Open your preferred web browser and navigate to localhost:3000
12. The best way to make an API request will be to use a program such as Postman

## Using the Website

_xxx._

## Link to GitHub Pages

_Link to GitHub repo:_
[Possible Sequel](https://github.com/jIrwinCline/possible-sequel.git)

## Known Bugs

There are no known bugs at this time.

## Support and Contact Details

Please contact us if you encounter issues with this program, have suggestions, or would like to contribute to this or future projects. Please contact us at the following:

Email:
- ajrmdn@gmail.com
- fatherofdharma@gmail.com
- jakobinwins@gmail.com
- lake.bramlett@gmail.com
- nramseysc@gmail.com

## Technologies Used

* Ruby
* Rails
* RubyGems
* Atom
* Git and Github
* PostgreSQL

### License

* _This software is licence under the MIT license._

Copyright (c) 2019 **_Nick Ramsey, Jacob Irwin, Abdellah Ramadan, Lake Bramlett, Daniel Hongel_**
