import '../css/app.css'
import 'unpoly'
import 'unpoly/unpoly.css'
import Alpine from 'alpinejs'
window.Alpine = Alpine
import modeDark from './mode_dark.js'

// data pour le mode dark
Alpine.data('modeDark', modeDark)

Alpine.start()
