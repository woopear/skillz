import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

/**
 * nous avons 2 parties du site bien distinctes :
 * public : pour les pages qui ne sont pas protégées
 * app : pour les pages protégées
 * comme nous n'avons pas de page /
 * nous redirigeons vers la page public
 */

export default class PublicsController {
  /**
   * affiche la page commercial
   * @param {HttpContextContract} { view }
   * @return {*} 
   * @memberof PublicsController
   */
  public async displayHome ({ view }: HttpContextContract) {
    return view.render('public/home', { title: 'Skillz' })
  }

  /**
   * redirection sur la route de la page commercial
   * @param {HttpContextContract} { response }
   * @return {*} 
   * @memberof PublicsController
   */
  public async redirectHome ({ response }: HttpContextContract) {
    return response.redirect('public')
  }
}
