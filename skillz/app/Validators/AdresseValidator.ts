import { schema, CustomMessages } from '@ioc:Adonis/Core/Validator'
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class AdresseValidator {
  constructor (protected ctx: HttpContextContract) {}

  public schema = schema.create({
    street: schema.string({ trim: true }),
    codePost: schema.string({ trim: true }),
    city: schema.string({ trim: true }),
  })

  public messages: CustomMessages = {}
}
