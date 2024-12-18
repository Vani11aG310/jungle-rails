# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

Default database used is PostgreSQL.

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Stripes is used to test the checkout page.

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Screenshots

![screenshot of main page](https://github.com/Vani11aG310/jungle-rails/blob/master/docs/main%20page.png?raw=true)
![screenshot of product cards](https://github.com/Vani11aG310/jungle-rails/blob/master/docs/product%20cards.png?raw=true)
![screenshot of product details page](https://github.com/Vani11aG310/jungle-rails/blob/master/docs/product%20details.png?raw=true)
![screenshot of admin dashboard](https://github.com/Vani11aG310/jungle-rails/blob/master/docs/admin%20dashboard.png?raw=true)