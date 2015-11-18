
Template.Quiz.events {
  'click button#quiz-start': (event, template) ->
    template.state.set('fsm', 'answer')

  'click button#quiz-finish': (event, template) ->

  'click button#challenge-review': (event, template) ->
    isCorrect = Math.random() >= 0.5
    if isCorrect
      score = template.state.get('score')
      template.state.set('score', score + 1)
    template.state.set('isCorrect', isCorrect)
    template.state.set('fsm', 'result')

  'click button#challenge-skip': (event, template) ->
    isCorrect = false
    template.state.set('isCorrect', isCorrect)
    template.state.set('fsm', 'result')

  'click button#challenge-next': (event, template) ->
    template.state.set('isCorrect', undefined)
    isLast = template.state.get('isLast')
    if isLast
      template.state.set('fsm', 'end')
    else
      current = template.state.get('current')
      template.state.set('current', current + 1)
      template.state.set('fsm', 'answer')

    template.$('.quiz #quiz-progress').progress('increment')
}


Template.Quiz.helpers {

  challenge: ->
    current = Template.instance().state.get('current')
    return @challenges[current]

  progress: ->
    return Template.instance().state.get('current')

  score: ->
    return Template.instance().state.get('score')

  progressTotal: ->
    return @challenges.length

  stateBegin: ->
    return Template.instance().state.equals('fsm', 'begin')

  stateReady: ->
    return Template.instance().state.equals('fsm', 'answer') or
           Template.instance().state.equals('fsm', 'result')

  stateAnswer: ->
    return Template.instance().state.equals('fsm', 'answer')

  stateResult: ->
    return Template.instance().state.equals('fsm', 'result')

  stateEnd: ->
    return Template.instance().state.equals('fsm', 'end')

  isCorrect: ->
    return Template.instance().state.equals('isCorrect', true)

  isIncorrect: ->
    return Template.instance().state.equals('isCorrect', false)

}


# Quiz: Lifecycle Hooks
Template.Quiz.onCreated ->
  self = this
  self.state = new ReactiveDict('quizState')
  self.state.set('current', 0)
  self.state.set('score', 0)
  # Main FSM: begin => answer => result => end
  self.state.set('fsm', 'begin')

  self.autorun (c) ->
    total = self.data.challenges.length
    current = self.state.get('current')
    isFirst = current == 0
    isLast = current == total - 1
    self.state.set('isFirst', isFirst)
    self.state.set('isLast', isLast)


Template.Quiz.onRendered ->
  this.$('.quiz #quiz-progress').progress({
    showActivity: false
    #label: 'ratio'
    #text: { ratio: '{value} de {total}' }
    value: 0
    total: @data.challenges.length
  })

Template.Quiz.onDestroyed ->
