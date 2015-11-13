Template.Challenge.events {}

Template.Challenge.helpers {

  getTemplateName: ->
    console.dir(this)
    return switch
      when this.type is 'header' then 'ElemHeader'
      when this.type is 'sentence' then 'ElemSentence'
      when this.type is 'paragraph' then 'ElemParagraph'
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
