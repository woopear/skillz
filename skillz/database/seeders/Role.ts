import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import Role from 'App/Models/Role'

export default class extends BaseSeeder {
  public async run () {
    const uniqueKey = 'libelle'

    await Role.updateOrCreateMany(uniqueKey, [
      {
        libelle: 'admin',
      },
      {
        libelle: 'candidat',
      },
      {
        libelle: 'root',
      },
      {
        libelle: 'manager',
      },
      {
        libelle: 'rh',
      },
    ])
  }
}
