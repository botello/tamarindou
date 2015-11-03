@Quizzes = new Mongo.Collection('quizzes')

QuizSchema = new SimpleSchema
  template:
    type: String
    label: 'Template'
    max: 50
  
  createdAt:
    type: Date
    autoValue: () ->
      if @isInsert
        return new Date
      if @isUpsert
        return {$setOnInsert: new Date}
      return @unset()

  updatedAt:
    type: Date
    autoValue: () ->
      if @isUpdate
        return new Date
    denyInsert: true
    optional: true



#if Meteor.isServer
#  Quizzes.allow
#    insert: (userId, doc) ->
#      true
#    update: (userId, doc, fieldNames, modifier) ->
#      true
#    remove: (userId, doc) ->
#      true
#
#  Quizzes.deny
#    insert: (userId, doc) ->
#      false
#    update: (userId, doc, fieldNames, modifier) ->
#      false
#    remove: (userId, doc) ->
#      false
