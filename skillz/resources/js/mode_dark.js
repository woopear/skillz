export default () => ({
  isDark: false,

  /**
   * init - Initialize the mode.
   * à la création du composant on check dans le 
   * localsorage si on est en mode dark ou pas
   * et on set la variable isDark
   */
  init () {
    if (
      localStorage.theme === 'dark' ||
          (!('theme' in localStorage) &&
            window.matchMedia('(prefers-color-scheme: dark)').matches)
    ) {
      document.documentElement.classList.add('dark')
      localStorage.theme = 'dark'
    } else {
      document.documentElement.classList.remove('dark')
      localStorage.theme = 'light'
    }
    this.isDark = window.matchMedia('(prefers-color-scheme: dark)').matches
  },

  /**
   * met ou enleve une class dark sur la balise html
   * créé une variable localStorage pour stocker le theme
   */
  switchModeDark () {
    document.documentElement.classList.toggle('dark')
    this.isDark = !this.isDark
    if(this.isDark) {
      localStorage.theme = 'light'
    }else{
      localStorage.theme = 'dark'
    }
  },
})
