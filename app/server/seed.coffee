
Quizzes.remove({})
if Quizzes.find().count() == 0
  [
    {
      name: 'quiz-1'
      challenges: [
        {
          elements: [
            { type: 'header', value: 'Completa el verso' }
            { type: 'sentence', value: 'Entre Melón y Melames' }
            { type: 'sentence', value: 'hicieron una orquesta' }
            { type: 'sentence', value: 'Melón toca el violín' }
            { type: 'token-word', value: 'y Melames la trompeta' }
          ]
          solution: {}
        }, {
          elements: [
            { type: 'header', value: 'Completa el verso' }
            { type: 'token-sentence', value:
              'Si porque me ves con botas#crees que soy vaquero#sácame la leche a gotas#antes de que se me vuelva suero' }
          ]
          solution: {}
        }, {
          elements: [
            { type: 'header', value: 'Resuelve el retruécano' }
            { type: 'sentence', value: 'No es lo mismo...' }
            { type: 'sentence', value: 'Anita, siéntate en la hamaca,' }
            { type: 'token-syllable', value: 'que sién|ta|te en la ma|ca|ni|ta' }
          ]
          solution: {}
        }, {
          elements: [
            { type: 'header', value: 'Completa la frase' }
            { type: 'sentence', value: 'Si me cayera en un mar de leche,' }
            { type: 'token-syllable', value: '¿me sa|ca|rí|as?' }
          ]
          solution: {}
        }, {
          elements: [
            { type: 'header', value: 'ordena la conversación' }
            { type: 'chat', value: ['Quema mucho el sol', 'Quema más la luna', 'Quema más abajo'] }
          ]
          solution: {}
        }
      ]
    }
  ].forEach (data) -> Quizzes.insert(data)
