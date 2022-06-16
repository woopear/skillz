import { schema, CustomMessages } from '@ioc:Adonis/Core/Validator'
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class RoleValidator {
  constructor (protected ctx: HttpContextContract) {}

  public schema = schema.create({
    libelle: schema.string({ trim: true }),
  })

  public messages: CustomMessages = {}
}
