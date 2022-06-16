import { DateTime } from 'luxon'
import Hash from '@ioc:Adonis/Core/Hash'
import {
  column,
  beforeSave,
  BaseModel,
  afterCreate,
} from '@ioc:Adonis/Lucid/Orm'

export default class User extends BaseModel {
  @column({ isPrimary: true })
  public id: string

  @column()
  public firstname: string

  @column()
  public lastname: string

  @column()
  public username: string

  @column()
  public idskillz: string

  @column()
  public email: string

  @column({ serializeAs: null })
  public password: string

  @column()
  public phone: string

  @column()
  public rememberMeToken?: string

  @column()
  public roleId: number

  @column()
  public stateId: number

  @column()
  public adresseId: number

  @column()
  public companieId: number

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  @beforeSave()
  public static createUsername (user: User) {
    if (user.$dirty.firstname && user.$dirty.lastname) {
      user.username = `${user.firstname} ${user.lastname}`
    }
  }

  @afterCreate()
  public static async createIdSkillz (user: User) {
    const idskillz = `${user.email}-${user.id}`
    await user.merge({ idskillz }).save()
  }

  @beforeSave()
  public static async hashPassword (user: User) {
    if (user.$dirty.password) {
      user.password = await Hash.make(user.password)
    }
  }
}
