import BaseSeeder from '@ioc:Adonis/Lucid/Seeder'
import Adresse from 'App/Models/Adresse'
import Companie from 'App/Models/Companie'
import Role from 'App/Models/Role'
import State from 'App/Models/State'
import User from 'App/Models/User'

export default class extends BaseSeeder {
  public async run () {
    const role = await Role.findBy('libelle', 'root')
    const state = await State.findBy('libelle', 'Validé')
    const companie = await Companie.findBy('denomination', 'woopear')
    // john
    const adresseJohn = await Adresse.findBy('street', '24 impasse en pesse monture')
    // david
    const adresseDavid = await Adresse.findBy('street', '')

    const users = await User.createMany([
      // john 
      {
        firstname: 'John',
        lastname: 'Haimez',
        email: 'haimezjohn@gmail.com',
        password: 'john',
        phone: '0651118657',
      },

      // david
      {
        firstname: 'David',
        lastname: '',
        email: '',
        password: '',
        phone: '',
      },
    ])

    // on recupere les users créés
    const john = users.find(e => e.firstname === 'John')
    const david = users.find(e => e.firstname === 'David')

    // creation relation role
    if(john && david) {
      await role?.related('user').create(john)
      await role?.related('user').create(david)
    }

    // creation relation state
    if(john && david) {
      await state?.related('user').create(john)
      await state?.related('user').create(david)
    }

    // creation relation adresse
    if(john && david) {
      await adresseJohn?.related('user').create(john)
      await adresseDavid?.related('user').create(david)
    }

    // creation relation companie
    if(john && david) {
      await companie?.related('user').create(john)
      await companie?.related('user').create(david)
    }
  }
}
