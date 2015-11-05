shuffle = (array) ->
  currentIndex = array.length
  temporaryValue = 0
  randomIndex

  # While there remain elements to shuffle...
  while (0 != currentIndex)

    # Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex)
    currentIndex -= 1

    # And swap it with the current element.
    temporaryValue = array[currentIndex]
    array[currentIndex] = array[randomIndex]
    array[randomIndex] = temporaryValue
  
  return array


Template.ChallengeTokenSyllable.events {

  'click #drop-box button': (event, template) ->
    text = event.currentTarget.value
    Template.instance().drop_tokens.remove text
    Template.instance().pick_tokens.push   text

  'click #pick-box button': (event, template) ->
    text = event.currentTarget.value
    Template.instance().pick_tokens.remove text
    Template.instance().drop_tokens.push   text

}

Template.ChallengeTokenSyllable.helpers {
  pick_tokens: -> return Template.instance().pick_tokens.list()
  drop_tokens: -> return Template.instance().drop_tokens.list()
}

# ChallengeTokenSyllable: Lifecycle Hooks
Template.ChallengeTokenSyllable.onCreated ->
  tokens = @data.question.join(' ').split(' ')
  shuffle(tokens)

  @pick_tokens = new ReactiveArray tokens
  @drop_tokens = new ReactiveArray()

Template.ChallengeTokenSyllable.onRendered ->

Template.ChallengeTokenSyllable.onDestroyed ->
