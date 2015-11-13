
Template.Quiz.events {}

Template.Quiz.helpers {

  getChallenge: ->
    #console.dir(this)
    current = Template.instance().currentChallenge.get()
    return this.challenges[current]

  nextChallenge: ->
    total = this.challenges.count()
    current = Template.instance.currentChallenge.get()
    if current <= total
      Template.intance().currentChallenge.set(current + 1)

}

# Quiz: Lifecycle Hooks
Template.Quiz.onCreated ->
  @currentChallenge = new ReactiveVar(0)


Template.Quiz.onRendered ->
  this.$('.ui .progress').progress({
    showActivity: false
  })

Template.Quiz.onDestroyed ->
