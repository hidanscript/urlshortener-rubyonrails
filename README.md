# README

Simple REST Api for Url shortener example, made with Ruby on Rails by David Marcano.

## Setup

- Make sure that Ruby and Ruby on Rails are installed.
- Run `gem install` in terminal.
- Run `rake db:create` and `rake db:migrate`
- Run `rails server`, now the local server is running in localhost:3000!

## Guides

- POST ROUTES: `http://localhost:3000` and  `http://localhost:3000/urls`
- JSON Body must contain
    ```
        {
            "destiny": "your destiny url"
        }
    ```