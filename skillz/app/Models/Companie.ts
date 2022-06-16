import { DateTime } from 'luxon'
import { BaseModel, column, HasMany, hasMany } from '@ioc:Adonis/Lucid/Orm'
import User from './User'

export default class Companie extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public denomination: string

  @column()
  public filliale: string

  @column()
  public siret: string

  @column()
  public code_naf: string

  @column()
  public online: boolean

  @column()
  public email: string

  @hasMany(() => User)
  public user: HasMany<typeof User>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
