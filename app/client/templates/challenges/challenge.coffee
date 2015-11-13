Template.Challenge.events {}

Template.Challenge.helpers {

  getTemplateName: ->
    #console.dir(this)
    return switch
      when this.type is 'header' then 'ElementHeader'
      when this.type is 'sentence' then 'ElementSentence'
      when this.type is 'paragraph' then 'ElementParagraph'
      else 'Unknown'

  innerContext: ->
    return {
      atts: {}
      text: this.value
    }

}

# Challenge: Lifecycle Hooks
Template.Challenge.onCreated ->

Template.Challenge.onRendered ->

Template.Challenge.onDestroyed ->
