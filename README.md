# Rails API Starter

I created this Rails API starter repo to help myself create projects easier. I found that each time I would start working on a freelance or personal project, I would spend a lot of time getting these things up, because most of the time I am setting up rails now for APIs to mobile applications or a React application.
The hardest part for me was always getting the testing set up correctly and authentication/JWTs.
This starter kit makes it super simple to start mocking out your features without needing to worry about all the basics like getting tests setup correctly and authentication.
You will be able to start adding your models and controllers and accessing your data in no time.

Let me know if you have any questions. I would accept pull requests if they don't add too many opinionated items to this repo. I want this to be very simple so that is easy to customize for users.
Feel free to Fork and use as you want!

Included in this starter
- Basic API signup and login authentication (with JWT for authentication)
- `pg` gem for Postgres database
- RSpec for testing
- FactoryBot, Faker, and Shoulda matchers for easier testing
- DatabaseCleaner for cleaning database between tests
- `.env` file with `set_env` helper for testing
- Timecop for mocking time during tests

