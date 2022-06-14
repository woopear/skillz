import { schema, CustomMessages, rules } from '@ioc:Adonis/Core/Validator'
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class CompanieValidator {
  constructor (protected ctx: HttpContextContract) {}

  public schema = schema.create({
    denomination: schema.string({ trim: true }),
    filliale: schema.string({ trim: true }),
    siret: schema.string({ trim: true }),
    code_naf: schema.string({ trim: true }),
    online: schema.boolean(),
    email: schema.string({ trim: true }, [rules.email()]),
  })

  public messages: CustomMessages = {}
}
