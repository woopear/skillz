import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Role from 'App/Models/Role'
import RoleValidator from 'App/Validators/RoleValidator'

export default class RolesController {
  /**
     * get all roles
     * @param {HttpContextContract} ctx
     * @memberof RolesController
     */
  public async get (ctx: HttpContextContract) {
    const roles = await Role.all()
    // todo mettre view
  }

  /**
     * get one role
     * @param {HttpContextContract} ctx
     * @memberof RolesController
     */
  public async getOne (ctx: HttpContextContract) {
    const role = await Role.findOrFail(ctx.params.id)
    // todo mettre view
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
    return response.redirect().back()
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
    return response.redirect().back()
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
    return response.redirect().back()
  }
}
