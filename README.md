quizhub
=======

small app for tracking requests with voting. in the initial case, for rubyquiz ideas

In the queue:
x anyone can view the list; need to login to vote or supply your answer
x users
    1. Need admin flag
_ to track voting
    1. user should only be able to vote on each quiz once
    2. once voted, they can reverse or cancel their vote
    3. Vote model -- user_id, quiz_id, vote (1, -1)
    4. Cancel a vote - remove from table. 
- responses (repo for results of a quiz)
    1. user goes to Current Quiz page
    2. presses "I accept this challenge" and enter a repo location
    3. users and repos listed on quiz Show page
- comments [model created]
    1. display on quiz show page
    2. button for optional display on Active Quiz page
    3. admin page to delete any that are inappropriate
- emails for new releases, etc. [in process]
    1. Send my own email a copy from Current Quiz page.
    2. Sign up for an auto email each time a new quiz is released
- release an item for "current" quiz, due date [release model]
    1. user logs in and reviews list
    2. user goes to edit(?) screen and presses Release button
    3. generate Release record, update Quiz to active (partially complete)
    4. mark all other quizzes as not-active
    5. mark all other releases as not-active
- mark completed quizes for archive
    1. On current quiz page, need a button to complete/archive the quiz
_ tests

Models to come:
x use and maintain categories
x comments
x releases
- votes (user, quiz, up/down) - allow modification/swap
- track user/quiz/repo
- user assigned to "source"

Other features:
x Pagination (will_paginate gem)
x Static pages (high_voltage gem)
x Slim templates (some complete...)

-------------------------------------------------------------------------------------

To update db/model annotations -- 'bundle exec annotate --position before' 
