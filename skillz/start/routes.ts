import Route from "@ioc:Adonis/Core/Route";

// groupe page public
Route.group(() => {
  // home
  Route.get("/", "PublicsController.displayHome");
  // page de creation user
  Route.get("/register", "AuthController.showRegister").middleware(
    "silentAuth"
  );
  // envoie formulaire creation user
  Route.post("/register/create", "AuthController.register");
  // page de connexion
  Route.get("/login", "AuthController.showLogin").middleware("silentAuth");
  // envoie formulaire connexion
  Route.post("/login/connexion", "AuthController.login");
}).prefix("/public");

// route principale rediriger sur la partie commerce
Route.get("/", "PublicsController.redirectHome");

// groupe page app
Route.group(() => {
  // home
  Route.get("/", ({ view }) => {
    return view.render("app/home");
  });

  Route.get("/collaborateur", ({ view }) => {
    return view.render("app/collaborateur");
  });

  // deconnexion
  Route.delete("/logout", "AuthController.logout");
})
  .prefix("/app")
  .middleware("auth");
