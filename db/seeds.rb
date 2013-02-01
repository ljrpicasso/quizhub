# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
categories = Category.create(
  [
    { name: 'OpenSource' },
    { name: 'GettyTools' },
    { name: 'Personal' },
    { name: 'Pairing' },
    { name: 'NewTech' },
    { name: 'JustFun' },
    { name: 'Algorithms' }
  ]
)

quizzes = Quiz.create(
  [
    { name: 'Remove flickraw gem', points: 0, 
      description: 'Work with flickr API to search for images without the flickr gem', 
      source: 'CJ' },
    { name: 'Use ConnectAPI', points: 0, 
      description: 'Use ConnectAPI to ...', source: 'CJ' },
    { name: 'Rails4 Cookbook App', points: 0, 
      description: 'Use Rails4 to create a cookbook app, so we can learn more about Rails4', 
      source: 'Damon' },
    { name: 'Git Hook into HipChat', points: 0, 
      description: 'Post-commit git hook that posts updates to hipchat', 
      source: 'Manderson' },
    { name: 'Rally Watcher for HipChat', points: 0, 
      description: "Rally watcher - use Rally's API to see if we are over the WIP limit, and then notify the hipchat room", 
      source: 'JR' },
    { name: 'RubyQuiz tracker', points: 0, 
      description: 'In-house app to replace corkboard, etc.', 
      source: 'Joel' },
    { name: 'Elastic search', points: 0, 
      description: "Use Elastic Search to search in something we've built", 
      source: 'Darth' },
    { name: 'Automate with HipChat', points: 0, 
      description: 'Use hipchat to engage deploys or other automated tasks', 
      source: 'Damon' },
    { name: 'Sound Notifications', points: 0, 
      description: 'API to make sounds when events happen; run on Maltest-Falcon', 
      source: 'CJ' },
    { name: 'Endpoint Status Board', points: 0,
      description: 'Some sort of continuous display to show status of the endpoints', 
      source: 'Manderson' },
    { name: 'Random Open Source', points: 0, 
      description: 'Find an open source project and conribute something', 
      source: 'Darth' },
  ]
)


