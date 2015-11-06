
Quizzes.remove({})
if Quizzes.find().count() == 0
  [
    {
      name: 'quiz-1'
      challenges: [
        {
          template: 'token-word'
          question: [
            'Entre Melón y Melames'
            'hicieron una orquesta'
            'Melón toca el violín'
            'y Melames la trompeta'
          ]
        }, {
          template: 'token-line'
          question: [
            'Si porque me ves con botas'
            'crees que soy vaquero'
            'sácame la leche a gotas'
            'antes de que se me vuelva suero'
          ]
        }
      ]
    }, {
      name: 'quiz-2'
      challenges: [
        {
          template: 'token-syllable'
          question: [
            'No es lo mismo...'
            'Anita, siéntate en la hamaca,'
            'que siéntate en la macanita'
          ]
        }, {
          template: 'token-syllable'
          question: [
            'Si me cayera en un mar de leche,'
            '¿me sacarías?'
          ]
        }
      ]
    }, {
      name: 'quiz-3'
      challenges: [
        {
          template: 'chat'
          question: [
            'Quema mucho el sol'
            'Quema más la luna'
            'Quema más abajo'
          ]
        }
      ]
    }

  ].forEach (data) -> Quizzes.insert(data)
