import Route from '@ioc:Adonis/Core/Route'

// route principale rediriger sur la partie commerce
Route.get('/', 'PublicsController.redirectHome')

// groupe page public
Route.group(() => {
  // home
  Route.get('/', 'PublicsController.displayHome')

  // page de creation user
  Route.get('/register', 'AuthController.showRegister').middleware(
    'silentAuth'
  )

  // page de connexion
  Route.get('/login', 'AuthController.showLogin').middleware('silentAuth')

  // envoie formulaire create user
  Route.post('/register/create', 'AuthController.register')

  // envoie formulaire connexion
  Route.post('/login/connexion', 'AuthController.login')
}).prefix('/public')

// groupe page app
Route.group(() => {
  // home
  Route.get('/', 'AppsController.showDashboard')

  // role
  Route.get('/roleselectedfordashboard/:id', 'RolesController.getOneProfilForDashboard')
  Route.post('/role/create', 'RolesController.create')
  Route.put('/role/update/:id', 'RolesController.update')
  Route.delete('/role/delete/:id', 'RolesController.delete')

  // state
  Route.get('/stateselectedfordashboard/:id', 'StatesController.getOneProfilForDashboard')
  Route.post('state/create', 'StatesController.create')
  Route.put('state/update/:id', 'StatesController.update')
  Route.delete('state/delete/:id', 'StatesController.delete')

  // collaborateurs
  Route.get('/collaborateur', ({ view }) => {
    return view.render('app/collaborateur')
  })

  // deconnexion user
  Route.delete('/logout', 'AuthController.logout')
})
  .prefix('/app')
  .middleware('auth')
