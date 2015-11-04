Meteor.subscribe('quizzes')


Template.Quiz.events {}

Template.Quiz.helpers {
  quizzes: ->
    return Quizzes.find()
}

# Quiz: Lifecycle Hooks
Template.Quiz.onCreated ->

Template.Quiz.onRendered ->

Template.Quiz.onDestroyed ->
