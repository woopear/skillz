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

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime

  // avant save et si firstname et lastname sont modifier on modifie username
  @beforeSave()
  public static createUsername (user: User) {
    if (user.$dirty.firstname && user.$dirty.lastname) {
      user.username = `${user.firstname} ${user.lastname}`
    }
  }

  // apres creation on creer le idskillz
  @afterCreate()
  public static async createIdSkillz (user: User) {
    const idskillz = `${user.email}-${user.id}`
    await user.merge({ idskillz }).save()
  }

  // avant save et si password est modifie on le hash et on enregistre le password
  @beforeSave()
  public static async hashPassword (user: User) {
    if (user.$dirty.password) {
      user.password = await Hash.make(user.password)
    }
  }
}
