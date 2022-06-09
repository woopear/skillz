import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import User from "App/Models/User";
import AuthValidator from "App/Validators/AuthValidator";
import CreateUserValidator from "App/Validators/CreateUserValidator";

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
    const payload = await request.validate(CreateUserValidator);

    // creation user
    const user = await User.create({ ...payload });

    // si user est bien créé
    if (user) {
      // create idskillz
      await user.merge({ idskillz: `${user.email}-${user.id}` }).save();
      // connexion user
      await auth.attempt(payload.email, payload.password);
    }

    // si user connecter sinon retour page login
    if (auth.user) {
      return response.redirect("/app");
    }
    return response.redirect("public/login");
  }

  public async login({ request, response, auth }: HttpContextContract) {
    const payload = await request.validate(AuthValidator);

    // connexion user
    await auth.attempt(payload.email, payload.password);

    // si user connecter sinon retour page login
    if (auth.user) {
      return response.redirect("/app");
    }
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
