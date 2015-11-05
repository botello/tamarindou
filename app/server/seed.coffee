
if Quizzes.find().count() == 0
  [
    {
      template: 'token'
      question: [
        'Entre Melón y Melames'
        'hicieron una orquesta'
        'Melón toca el violín'
        'Melames la trompeta'
      ]
    }, {
      template: 'token'
      question: [
        'Si porque me ves con botas'
        'crees que soy vaquero'
        'sácame la leche a gotas'
        'antes de que se me vuelva suero'
      ]
    }, {
      template: 'token'
      question: [
        'No es lo mismo...'
        'Anita, siéntate en la hamaca,'
        'que siéntate en la macanita'
      ]
    }, {
      template: 'token'
      question: [
        'Si me cayera en un mar de leche,'
        '¿me sacarías?'
      ]
    }, {
      template: 'chat'
      question: [
        'Quema mucho el sol'
        'Quema más la luna'
        'Quema más abajo'
      ]
    }

  ].forEach (data) -> Quizzes.insert(data)
