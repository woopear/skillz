import { DateTime } from 'luxon'
import { BaseModel, beforeCreate, column, HasMany, hasMany } from '@ioc:Adonis/Lucid/Orm'
import User from './User'

export default class Adresse extends BaseModel {
  @column({ isPrimary: true })
  public id: number

  @column()
  public street: string

  @column()
  public codePost: string

  @column()
  public city: string

  @column()
  public address: string

  @hasMany(() => User)
  public user: HasMany<typeof User>

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @beforeCreate()
  public static async createAdresse (adresse: Adresse) {
    if(adresse.$dirty.street && adresse.$dirty.codePost && adresse.$dirty.city) {
      adresse.address = `${adresse.street.toLowerCase()} ${adresse.codePost} ${adresse.city.toLowerCase()}`
    }
  }
}
