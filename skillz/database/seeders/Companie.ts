import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import Companie from 'App/Models/Companie'

export default class extends BaseSeeder {
  public async run () {
    const uniqueKey = 'siret'

    await Companie.updateOrCreateMany(uniqueKey, [
      // woopear
      {
        denomination: 'woopear',
        filliale: 'hérimoncourt',
        siret: '123456789',
        code_naf: '123456789',
        online: true,
        email: 'woopears@gmail.com',
      },
    ])
  }
}
