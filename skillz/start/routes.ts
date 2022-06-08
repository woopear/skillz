import Route from "@ioc:Adonis/Core/Route";

// groupe page public
Route.group(() => {
  Route.get("/", "PublicsController.displayHome");
}).prefix("/public");

// route principale rediriger sur la partie commerce
Route.get("/", "PublicsController.redirectHome");
