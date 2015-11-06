Meteor.subscribe 'quizzes'

Template.Game.events {}

Template.Game.helpers {
  quizzes: ->
    return Quizzes.find()
}

# Game: Lifecycle Hooks
Template.Game.onCreated ->

Template.Game.onRendered ->

Template.Game.onDestroyed ->
