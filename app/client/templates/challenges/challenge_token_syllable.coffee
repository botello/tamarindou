
Template.ChallengeTokenSyllable.events {
  'click #drop-box button': (event, template) ->
    template.dropTokens.remove parseInt(event.currentTarget.value)
    template.pickTokens.push   parseInt(event.currentTarget.value)

  'click #pick-box button': (event, template) ->
    template.pickTokens.remove parseInt(event.currentTarget.value)
    template.dropTokens.push   parseInt(event.currentTarget.value)
}

Template.ChallengeTokenSyllable.helpers {
  tokenText: (id) -> Template.instance().tokens[id]
  pickTokens: -> Template.instance().pickTokens.list()
  dropTokens: -> Template.instance().dropTokens.list()
}

# ChallengeTokenSyllable: Lifecycle Hooks
Template.ChallengeTokenSyllable.onCreated ->
  # List of todkens with its index
  @tokens = _.flatten(_.map(@data.question.join(' ').split(' '), (w) -> Hypher.languages.es.hyphenate(w)))
  @pickTokens = new ReactiveArray _.shuffle(_.range(@tokens.length))
  @dropTokens = new ReactiveArray()

Template.ChallengeTokenSyllable.onRendered ->

Template.ChallengeTokenSyllable.onDestroyed ->
