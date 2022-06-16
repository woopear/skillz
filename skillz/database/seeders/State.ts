import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import State from 'App/Models/State'

export default class extends BaseSeeder {
  public async run () {
    const uniqueKey = 'libelle'

    await State.updateOrCreateMany(uniqueKey, [
      {
        libelle: 'En attente',
      },
      {
        libelle: 'Validé',
      },
      {
        libelle: 'Bannis',
      },
      {
        libelle: 'Archivé',
      },
    ])
  }
}
