Template.ChallengeTokenSyllable.events {

  'click #drop-box button': (event, element) ->
    Template.instance().drop_tokens.remove element.value
    Template.instance().pick_tokens.push element.value

  'click #pick-box button': (event, element) ->
    Template.instance().pick_tokens.remove element.value
    Template.instance().drop_tokens.push element.value

}

Template.ChallengeTokenSyllable.helpers {

  pick_tokens: -> Template.istance().pick_tockens.list()

  drop_tokens: -> Template.instance().drop_tokens.list()
}

# ChallengeTokenSyllable: Lifecycle Hooks
Template.ChallengeTokenSyllable.onCreated ->
  this.drop_tokens = new ReactiveArray()
  this.pick_tokens = new ReactiveArray this.question

Template.ChallengeTokenSyllable.onRendered ->

Template.ChallengeTokenSyllable.onDestroyed ->
