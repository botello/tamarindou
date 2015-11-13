Template.Challenge.events {}

Template.Challenge.helpers {

  getTemplateName: ->
    return 'ElemHeader'

  innerContext: ->
    return {
      atts: {}
      text: "Hello World"
    }

}

# Challenge: Lifecycle Hooks
Template.Challenge.onCreated ->

Template.Challenge.onRendered ->

Template.Challenge.onDestroyed ->
