---
  tags: sinatra, bundler, sequel, orm, tdd
  languages: ruby
---

# Part 2 - Persistence

## Deliverable

Work in your existing repository. Your solution should be delivered in a
branch called "part-2-solution".

## Instructions

### Grab the new code

In your fork, `fetch` from this repository.

This code will be in the `part-2` branch.

Feel free to build your solution off this branch (which
includes the solution to part 1 minus the views and routes).

If you'd like to use your existing solution, copy the updated spec
folder into your personal solution.

### Update your infrastructure

If you're working with your own solution, you'll need to update your
environment. It should mirror the environment setup in this branch.

Put all the gems you'll be using in a Gemfile.
Make sure to set up bundler correctly! (like in our bundler lab).

You should move your require statements into your
config/environment.rb file. Your config.ru should like this:

```ruby
  require './config/environment'

  run GameApp
```

### Get the tests to pass

Create an RPSGameResults model backed by Sequel and get the tests passing. If
you're not building off of the provided solution to part 1, then just copy/paste
the specs into your project.

RPSGameResults should be stored in an "rps_game_results" table, which looks
like: 

* human_play - human player's play
* computer_play - the computer's play
* won - true if the player won, false if not. Use the Boolean column
  type.
* tied - true if their was a tie, false if not. Use the Boolean column
  type.
* created_at - approximately when the game results were calculated. Use
  the DateTime column type.

Use a migration and run it manually.

### Update the Sinatra application

Change your application to have exactly 4 routes:

* GET /rps_game
  - Renders a form that provides the RPS choices with a radio button element.
* POST /rps_game
  - Form submissions should be sent here. The result of the game should
    be stored in the database. Users should be redirected to GET
/rps_game_result/:id.
* GET /rps_game_result/:id
  - Displays the result of the game with primary key :id.
* GET /rps_game_results
  - A list of the last 20 game results ordered by most to least recent. 
