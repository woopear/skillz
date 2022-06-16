import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import RolesController from './RolesController'
import StatesController from './StatesController'

export default class AppsController {
  /**
   * affiche la page dashbord
   * @param {HttpContextContract} ctx
   * @return {roles, states, title || roles, states, state, role, title} 
   * @memberof AppsController
   */
  public async showDashboard (ctx: HttpContextContract) {
    const roles = await RolesController.get(ctx)
    const states = await StatesController.get(ctx)
    const roleSelected = ctx.request.qs().role
    const stateSelected = ctx.request.qs().state

    if(roleSelected){
      return ctx.view.render('app/home', {
        roles,
        states,
        title: 'Skillz app',
        role: roleSelected ?? null,
      })
    }

    if(stateSelected){
      return ctx.view.render('app/home', {
        roles,
        states,
        title: 'Skillz app',
        etat: stateSelected ?? null,
      })
    }

    return ctx.view.render('app/home', {roles, states, title: 'Skillz app'})
  }
}
