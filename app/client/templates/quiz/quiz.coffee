
Template.Quiz.events {}

Template.Quiz.helpers {}

# Quiz: Lifecycle Hooks
Template.Quiz.onCreated ->

Template.Quiz.onRendered ->
  this.$('#quiz-progress').progress({
    showActivity: false
  })

Template.Quiz.onDestroyed ->
