import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import State from 'App/Models/State'
import StateValidator from 'App/Validators/StateValidator'

export default class StatesController {
  /**
     * get all roles
     * @param {HttpContextContract} ctx
     * @memberof StatesController
     */
  public static async get (ctx: HttpContextContract) {
    const states = await State.all()
    return states
  }

  /**
     * get one role
     * @param {HttpContextContract} ctx
     * @memberof StatesController
     */
  public static async getOne (ctx: HttpContextContract) {
    const state = await State.findOrFail(ctx.params.id)
    return state
  }

  /**
   * recupere un role et retourne ce role sur la page dashboard
   * @param ctx HttpContextContract
   * @returns redirect sur dashboard avec le role en parametre
   */
  public async getOneProfilForDashboard (ctx: HttpContextContract) {
    const state = await State.findOrFail(ctx.params.id)
    return ctx.response.redirect().toRoute('AppsController.showDashboard', {}, {qs: {state}})
  }

  /**
   * creation de roles
   * @param {HttpContextContract} ctx
   * @return {*} 
   * @memberof StatesController
   */
  public async create (ctx: HttpContextContract) {
    const { request, response } = ctx
    const payload = await request.validate(StateValidator)
    await State.create(payload)
    return response.redirect().toRoute('AppsController.showDashboard')
  }

  /**
   * update roles
   * @param {HttpContextContract} ctx
   * @return {*} 
   * @memberof StatesController
   */
  public async update (ctx: HttpContextContract) {
    const { request, response, params } = ctx
    const payload = await request.validate(StateValidator)
    const state = await State.findOrFail(params.id)
    await state.merge(payload).save()
    return response.redirect().toRoute('AppsController.showDashboard', {}, {qs: {state}})
  }

  /**
   * delete roles
   * @param {HttpContextContract} ctx
   * @return {*} 
   * @memberof StatesController
   */
  public async delete (ctx: HttpContextContract) {
    const { response, params } = ctx
    const state = await State.findOrFail(params.id)
    await state.delete()
    return response.redirect().toRoute('AppsController.showDashboard')
  }
}
