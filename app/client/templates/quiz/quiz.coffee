
Template.Quiz.events {
  'click button#challenge-review': (event, template) ->
    isDone = true
    isCorrect = Math.random() >= 0.5
    template.currentChallengeIsDone.set(isDone)
    template.currentChallengeIsCorrect.set(isCorrect)

  'click button#challenge-skip': (event, template) ->
    isDone = true
    isCorrect = false
    template.currentChallengeIsDone.set(isDone)
    template.currentChallengeIsCorrect.set(isCorrect)

  'click button#challenge-next': (event, template) ->
    total = this.challenges.length
    current = template.currentChallenge.get()
    isLast = total == current + 1
    if not isLast
      template.currentChallenge.set(current + 1)
      template.currentChallengeIsDone.set(false)
}


Template.Quiz.helpers {

  getChallenge: ->
    current = Template.instance().currentChallenge.get()
    return this.challenges[current]

  canReview: ->
    isDone = Template.instance().currentChallengeIsDone.get()

    total = this.challenges.length
    current = Template.instance().currentChallenge.get()
    isLast = current == total - 1

    return not isLast and not isDone

  canContinue: ->
    isDone = Template.instance().currentChallengeIsDone.get()

    total = this.challenges.length
    current = Template.instance().currentChallenge.get()
    isLast = current == total - 1

    return isDone and not isLast

  canExit: ->
    isDone = Template.instance().currentChallengeIsDone.get()

    total = this.challenges.length
    current = Template.instance().currentChallenge.get()
    isLast = current == total - 1

    console.log('isDone: ' + isDone)
    console.log('isLast: ' + isLast)

    return isDone and isLast

  isDoneAndCorrect: ->
    isDone = Template.instance().currentChallengeIsDone.get()
    isCorrect = Template.instance().currentChallengeIsCorrect.get()
    return isDone and isCorrect

  isDoneAndIncorrect: ->
    isDone = Template.instance().currentChallengeIsDone.get()
    isCorrect = Template.instance().currentChallengeIsCorrect.get()
    return isDone and not isCorrect

}


# Quiz: Lifecycle Hooks
Template.Quiz.onCreated ->
  @currentChallenge = new ReactiveVar(0)
  @currentChallengeIsDone = new ReactiveVar(false)
  @currentChallengeIsCorrect = new ReactiveVar(false)


Template.Quiz.onRendered ->
  this.$('.ui .progress').progress({
    showActivity: false
  })


Template.Quiz.onDestroyed ->
