
if Quizzes.find().count() == 0
  [
    { template: 'true-or-false' }
    { template: 'single-choice' }
    { template: 'multiple-choice' }
  ].forEach (data) -> Quizzes.insert(data)
