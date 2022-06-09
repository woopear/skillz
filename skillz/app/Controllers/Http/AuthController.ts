import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import User from "App/Models/User";

export default class AuthController {
  // affiche page register
  public async showRegister({ view, auth, response }: HttpContextContract) {
    // si user connecter redirige sur app home
    if (auth.user) {
      return response.redirect("/app");
    }
    // sinon on reste sur la meme page
    return view.render("public/register");
  }

  // affiche page login
  public async showLogin({ view, auth, response }: HttpContextContract) {
    if (auth.user) {
      return response.redirect("/app");
    }
    return view.render("public/login");
  }

  // creation de user + connexion
  public async register({ request, response, auth }: HttpContextContract) {
    const payload = request.only([
      "firstname",
      "lastname",
      "phone",
      "email",
      "password",
    ]);

    // creation user
    const user = await User.create({ ...payload });
    if (user) {
      // connexion user
      await auth.attempt(payload.email, payload.password);
    }

    // si user connecter
    if (auth.user) {
      return response.redirect("/app");
    }
    // sinon retour page login
    return response.redirect("public/login");
  }

  public async login({ request, response, auth }: HttpContextContract) {
    const payload = request.only(["email", "password"]);

    // connexion user
    await auth.attempt(payload.email, payload.password);

    // si user connecter
    if (auth.user) {
      return response.redirect("/app");
    }
    // sinon retour page login
    return response.redirect().back();
  }

  // déconnexion user
  public async logout({ response, auth }: HttpContextContract) {
    // deconnexion user
    await auth.logout();
    // redirige sur la page login
    return response.redirect("/public/login");
  }
}
