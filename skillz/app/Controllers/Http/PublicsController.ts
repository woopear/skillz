import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";

export default class PublicsController {
  // affiche la page commercial
  public async displayHome({ view }: HttpContextContract) {
    return view.render("public/home");
  }

  // redirection sur la route de la page commercial
  public async redirectHome({ response }: HttpContextContract) {
    return response.redirect("/public");
  }
}
