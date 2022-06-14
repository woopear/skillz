import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import RolesController from './RolesController'

export default class AppsController {
  /**
   * affiche la page dashbord
   * @param {HttpContextContract} ctx
   * @return {roles, title} 
   * @memberof AppsController
   */
  public async showDashboard (ctx: HttpContextContract) {
    const roles = await RolesController.get(ctx)
    const roleSelected = ctx.request.qs().role

    if(roleSelected){
      return ctx.view.render('app/home', {roles, title: 'Skillz app', role: roleSelected})
    }
    return ctx.view.render('app/home', {roles, title: 'Skillz app'})
  }
}