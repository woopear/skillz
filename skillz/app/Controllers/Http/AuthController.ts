import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'
import AuthValidator from 'App/Validators/AuthValidator'
import CreateUserValidator from 'App/Validators/CreateUserValidator'

export default class AuthController {
  /**
   * affiche page register
   * @param {HttpContextContract} { view, auth, response }
   * @return {title} 
   * @memberof AuthController
   */
  public async showRegister ({ view, auth, response }: HttpContextContract) {
    if (auth.user) {
      return response.redirect('/app')
    }

    return view.render('public/register', { title: 'Créer un compte skillz' })
  }

  /**
   * affiche page login
   * @param {HttpContextContract} { view, auth, response }
   * @return {title} 
   * @memberof AuthController
   */
  public async showLogin ({ view, auth, response }: HttpContextContract) {
    if (auth.user) {
      return response.redirect('/app')
    }
    return view.render('public/login', { title: 'Connexion skillz' })
  }

  /**
   * creation de user + connexion
   * @param {HttpContextContract} { request, response, auth }
   * @return {*} 
   * @memberof AuthController
   */
  public async register ({ request, response, auth }: HttpContextContract) {
    const payload = await request.validate(CreateUserValidator)
    const user = await User.create({ ...payload })

    if (user) {
      await auth.attempt(payload.email, payload.password)
    }

    if (auth.user) {
      return response.redirect('/app')
    }

    return response.redirect('public/login')
  }

  /**
   * connexion user
   * @param {HttpContextContract} { request, response, auth }
   * @return {*} 
   * @memberof AuthController
   */
  public async login ({ request, response, auth }: HttpContextContract) {
    const payload = await request.validate(AuthValidator)

    await auth.attempt(payload.email, payload.password)

    if (auth.user) {
      return response.redirect('/app')
    }

    return response.redirect().back()
  }

  /**
   * déconnexion user
   * @param {HttpContextContract} { response, auth }
   * @return {*} 
   * @memberof AuthController
   */
  public async logout ({ response, auth }: HttpContextContract) {
    await auth.logout()
    return response.redirect('/public/login')
  }
}
