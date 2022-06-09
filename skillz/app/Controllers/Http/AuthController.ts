import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";

export default class AuthController {
  // affiche page register
  public async showRegister({ view, auth, response }: HttpContextContract) {
    if (auth.user) {
      return response.redirect("app/home");
    }
    return view.render("public/register");
  }

  // affiche page login
  public async showLogin({ view, auth, response }: HttpContextContract) {
    if (auth.user) {
      return response.redirect("app/home");
    }
    return view.render("public/login");
  }

  /*public async register({
    request,
    response,
    session,
    auth,
  }: HttpContextContract) {
    return view.render("auth.register");
  }*/

  /*public async login({
    request,
    response,
    session,
    auth,
  }: HttpContextContract) {
    return view.render("auth.login");
  }*/
}
