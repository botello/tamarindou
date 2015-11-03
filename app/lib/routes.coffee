Router.configure
  layoutTemplate: 'MasterLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'


Router.route '/',
  name: 'home'
  controller: 'HomeController'
  where: 'client'
  layoutTemplate: 'MasterLayout'

Router.route '/game',
  name: 'game'
  controller: 'GameController'
  where: 'client'
  layoutTemplate: 'MasterLayout'
