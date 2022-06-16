import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import Adresse from 'App/Models/Adresse'

export default class extends BaseSeeder {
  public async run() {
    const uniqueKey = 'address'

    await Adresse.updateOrCreateMany(uniqueKey, [
      // john
      {
        street: '24 impasse en pesse monture',
        codePost: '25310',
        city: 'Hérimoncourt',
      },

      // david
      {
        street: 'rue des près',
        codePost: '70400',
        city: 'Héricourt',
      },
    ])
  }
}
