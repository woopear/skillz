import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Role from 'App/Models/Role'
import RoleValidator from 'App/Validators/RoleValidator'

export default class RolesController {
  /**
     * get all roles
     * @param {HttpContextContract} ctx
     * @memberof RolesController
     */
  public static async get () {
    const roles = await Role.all()
    return roles
  }

  /**
     * get one role
     * @param {HttpContextContract} ctx
     * @memberof RolesController
     */
  public static async getOne (ctx: HttpContextContract) {
    const role = await Role.findOrFail(ctx.params.id)
    return role
  }

  /**
   * recupere un role et retourne ce role sur la page dashboard
   * @param ctx HttpContextContract
   * @returns redirect sur dashboard avec le role en parametre
   */
  public async getOneProfilForDashboard (ctx: HttpContextContract) {
    const role = await Role.findOrFail(ctx.params.id)
    return ctx.response.redirect().toRoute('AppsController.showDashboard', {}, {qs: {role}})
  }

  /**
   * creation de roles
   * @param {HttpContextContract} ctx
   * @return {*} 
   * @memberof RolesController
   */
  public async create (ctx: HttpContextContract) {
    const { request, response } = ctx
    const payload = await request.validate(RoleValidator)
    await Role.create(payload)
    return response.redirect().toRoute('AppsController.showDashboard')
  }

  /**
   * update roles
   * @param {HttpContextContract} ctx
   * @return {*} 
   * @memberof RolesController
   */
  public async update (ctx: HttpContextContract) {
    const { request, response, params } = ctx
    const payload = await request.validate(RoleValidator)
    const role = await Role.findOrFail(params.id)
    await role.merge(payload).save()
    return response.redirect().toRoute('AppsController.showDashboard', {}, {qs: {role}})
  }

  /**
   * delete roles
   * @param {HttpContextContract} ctx
   * @return {*} 
   * @memberof RolesController
   */
  public async delete (ctx: HttpContextContract) {
    const { response, params } = ctx
    const role = await Role.findOrFail(params.id)
    await role.delete()
    return response.redirect().toRoute('AppsController.showDashboard')
  }
}
