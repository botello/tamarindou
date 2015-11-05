Meteor.subscribe('quizzes')


Template.Quiz.events {}

Template.Quiz.helpers {
  quizzes: ->
    return Quizzes.find()
}

# Quiz: Lifecycle Hooks
Template.Quiz.onCreated ->

Template.Quiz.onRendered ->
  this.$('#quiz-progress').progress({
    showActivity: false
  })

Template.Quiz.onDestroyed ->
