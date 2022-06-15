import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import RolesController from './RolesController'
import StatesController from './StatesController'

export default class AppsController {
  /**
   * affiche la page dashbord
   * @param {HttpContextContract} ctx
   * @return {roles, title} 
   * @memberof AppsController
   */
  public async showDashboard (ctx: HttpContextContract) {
    const roles = await RolesController.get(ctx)
    const states = await StatesController.get(ctx)
    const roleSelected = ctx.request.qs().role
    const stateSelected = ctx.request.qs().state

    // si un role est selectionné
    if(roleSelected){
      return ctx.view.render('app/home', {
        roles,
        states,
        title: 'Skillz app',
        role: roleSelected ?? null,
      })
    }

    // si un state est selectionné
    if(stateSelected){
      return ctx.view.render('app/home', {
        roles,
        states,
        title: 'Skillz app',
        etat: stateSelected ?? null,
      })
    }

    // basic
    return ctx.view.render('app/home', {roles, states, title: 'Skillz app'})
  }
}
