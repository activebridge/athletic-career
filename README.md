MyAthleticCareer [![Circle CI](https://circleci.com/gh/activebridge/athletic-career.svg?style=svg&circle-token=26614b014f5eeb27ae7accf9d6e2e03c2c675828)](https://circleci.com/gh/activebridge/athletic-career)
-

Links
-

[staging](http://staging.athletic-career.com)

[production](http://my.freestak.com)

[PivotalTracker](https://www.pivotaltracker.com/n/projects/1670389)

[Rollbar](https://rollbar.com/oleg-voloshyn/athletic-career/)

Setup
-

    git@github.com:activebridge/athletic-career.git
    bundle install
    cp config/database.yml.example config/database.yml
    cp config/secrets.yml.example config/secrets.yml
    cp config/cloudinary.yml.example config/cloudinary.yml
    rake db:create db:migrate db:seed
