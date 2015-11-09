
Template.ChallengeTokenSyllable.events {
  'click #drop-box button': (event, template) ->
    console.dir(event.currentTarget)
    Template.instance().dropTokens.remove parseInt(event.currentTarget.value)
    Template.instance().pickTokens.push   parseInt(event.currentTarget.value)

  'click #pick-box button': (event, template) ->
    console.dir(event.currentTarget)
    Template.instance().pickTokens.remove parseInt(event.currentTarget.value)
    Template.instance().dropTokens.push   parseInt(event.currentTarget.value)
}

Template.ChallengeTokenSyllable.helpers {
  tokenText: (id) -> Template.instance().tokens[id]
  pickTokens: -> Template.instance().pickTokens.list()
  dropTokens: -> Template.instance().dropTokens.list()
}

# ChallengeTokenSyllable: Lifecycle Hooks
Template.ChallengeTokenSyllable.onCreated ->
  # List of todkens with its index
  @tokens = @data.question.join(' ').split(' ')
  @pickTokens = new ReactiveArray _.shuffle(_.range(@tokens.length))
  @dropTokens = new ReactiveArray()

Template.ChallengeTokenSyllable.onRendered ->

Template.ChallengeTokenSyllable.onDestroyed ->
