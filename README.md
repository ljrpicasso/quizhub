quizhub
=======

small app for tracking requests with voting. in the initial case, for rubyquiz ideas

In the queue:
x users
_ to track voting and responses (repo for results of a quiz)
- comments
- emails for new releases, etc.
- release an item for "current" quiz, due date
- mark completed quizes for archive
x anyone can view; need login to vote or supply your answer

Models to come:
x use and maintain categories
- comments
- releases
- votes (user, quiz, up/down) - allow modification/swap
- user assigned to "source"

Other features:
x Pagination (will_paginate gem)
x Static pages (high_voltage gem)
x Slim templates

-------------------------------------------------------------------------------------

To update db/model annotations -- 'bundle exec annotate --position before' 
