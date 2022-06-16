import { schema, CustomMessages, rules } from '@ioc:Adonis/Core/Validator'
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class UserValidator {
  constructor (protected ctx: HttpContextContract) {}

  public schema = schema.create({
    firstname: schema.string({ trim: true }),
    lastname: schema.string({ trim: true }),
    email: schema.string({ trim: true }, [
      rules.email(),
      rules.unique({ table: 'users', column: 'email' }),
    ]),
    password: schema.string({ trim: true }),
    phone: schema.string({ trim: true }),
  })

  public messages: CustomMessages = {}
}
