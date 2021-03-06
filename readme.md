# Refinery CMS Registrations

__Registrations engine for Refinery CMS.__

Developed for bike race registration, but you can override and modify for your needs

## Requirements

This version of refinerycms-registrations supports Rails 4.2.x and Refinery CMS ~> 3.0.0. Works with PostgreSQL, MySQL and Sqlite

## Features

* start date and end date of registrations
* multiple published registrations
* grouping categories to group of categories
* live search in registered people
* live list of registered people on frontend
* humanizer antispam in registration

## Screenshots

All screenshots are in folder screenshots

![Edit registration](https://raw.github.com/Matho/refinerycms-registrations/master/screenshots/02_edit_registration.png)
![Live search people](https://raw.github.com/Matho/refinerycms-registrations/master/screenshots/05_live_search_people.png)
![List of people](https://raw.github.com/Matho/refinerycms-registrations/master/screenshots/12_list_of_registered_people.png)

## Language

Gem is fully translated to slovak and english. There is scaffolded support for es, fr, nb, nl with a mix of english words.
Antispam - humanizer is translated to 13 languages.


## Installation

Open up your ``Gemfile`` and add at the bottom this line:

```ruby
gem 'refinerycms-registrations', '~> 0.2.0'
```

Now, run

```ruby
bundle install
```

Next, to install run:

```ruby
 rails g refinery:registrations
```

Run database migrations:

```ruby
rake db:migrate
```

Seed your database:

```ruby
rake db:seed
```
If you don't have Chosen JS included in your backend yet, append this code to your_app/config/initializers/refinery/core.rb

```ruby
 config.register_javascript "refinery/race_registrations/admin/jquery.chosen.min.js"
 config.register_stylesheet "refinery/race_registrations/admin/chosen.css"
```

To config/initializers/mime_types add:
```
Mime::Type.register "application/xls", :xls
```

Before production, don't forget to precompile assets by:

```ruby
rake assets:precompile
```

## Todo list

* autocomplete in Club

## Code

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Matho/refinerycms-registrations)


## Testing
* cd to this engine path
* bundle install
* rake refinery:testing:dummy_app
* rake spec


## License

Refinery CMS Registrations engine is released under the MIT license. Created by Martin Markech.
