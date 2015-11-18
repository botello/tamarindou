
Template.Quiz.events {
  'click button#quiz-start': (event, template) ->
    template.state.set('fsm', 'answer')

  'click button#quiz-finish': (event, template) ->

  'click button#challenge-review': (event, template) ->
    isDone = true
    isCorrect = Math.random() >= 0.5
    template.state.set('isDone', isDone)
    template.state.set('isCorrect', isCorrect)

  'click button#challenge-skip': (event, template) ->
    isDone = true
    isCorrect = false
    template.state.set('isDone', isDone)
    template.state.set('isCorrect', isCorrect)

  'click button#challenge-next': (event, template) ->
    total = @challenges.length
    current = template.state.get('current')
    isLast = current == total - 1
    if not isLast
      template.state.set('current', current + 1)
      template.state.set('isDone', false)
}


Template.Quiz.helpers {

  challenge: ->
    current = Template.instance().state.get('current')
    return @challenges[current]

  progress: ->
    return Template.instance().state.get('current') / @challenges.length

  progressTotal: ->
    return @challenges.length

  stateBegin: ->
    return Template.instance().state.equals('fsm', 'begin')

  stateReady: ->
    return Template.instance().stateAnswer or
            Template.instance().stateReview or
            Template.instance().stateResult

  stateAnswer: ->
    return Template.instance().state.equals('fsm', 'answer')

  stateReview: ->
    return Template.instance().state.equals('fsm', 'review')

  stateResult: ->
    return Template.instance().state.equals('fsm', 'result')

  stateEnd: ->
    return Template.instance().state.equals('fsm', 'end')

  canReview: ->
    isDone = Template.instance().state.get('isDone')
    isLast = Template.instance().state.get('isLast')
    return not isLast and not isDone

  canContinue: ->
    isDone = Template.instance().state.get('isDone')
    isLast = Template.instance().state.get('isLast')
    return isDone and not isLast

  canExit: ->
    isDone = Template.instance().state.get('isDone')
    isLast = Template.instance().state.get('isLast')
    return isDone and isLast

  isDoneAndCorrect: ->
    isDone = Template.instance().state.get('isDone')
    isCorrect = Template.instance().state.get('isCorrect')
    return isDone and isCorrect

  isDoneAndIncorrect: ->
    isDone = Template.instance().state.get('isDone')
    isCorrect = Template.instance().state.get('isCorrect')
    return isDone and not isCorrect

}


# Quiz: Lifecycle Hooks
Template.Quiz.onCreated ->
  self = this
  self.state = new ReactiveDict('quizState')
  self.state.set('current', 0)
  self.state.set('isDone', false)
  self.state.set('isCorrect', false)
  # Main FSM: begin => answer => review => result => end
  self.state.set('fsm', 'begin')

  self.autorun (c) ->
    total = self.data.challenges.length
    current = self.state.get('current')
    isFirst = current == 0
    isLast = current == total - 1
    self.state.set('isFirst', isFirst)
    self.state.set('isLast', isLast)

  self.autorun (c) ->
    if (self.state.equals('fsm', 'begin'))
      console.log('fsm: begin')

    if (self.state.equals('fsm', 'answer'))
      console.log('fsm: answer')

    if (self.state.equals('fsm', 'review'))
      console.log('fsm: review')

    if (self.state.equals('fsm', 'result'))
      console.log('fsm: result')

    if (self.state.equals('fsm', 'end'))
      console.log('fsm: end')


Template.Quiz.onRendered ->
  self = this
  self.$('.ui .progress').progress({
    showActivity: false
  })


Template.Quiz.onDestroyed ->
  self = this
