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
    } else {
      document.documentElement.classList.remove('dark')
    }
    this.isDark = window.matchMedia('(prefers-color-scheme: dark)').matches
    !this.isDark ? this.textTooltip = 'Mode clair' : this.textTooltip = 'Mode sombre'
    console.log(this.textTooltip)
  },

  /**
   * met ou enleve une class dark sur la balise html
   * créé une variable localStorage pour stocker le theme
   */
  switchModeDark () {
    document.documentElement.classList.toggle('dark')
    this.isDark = !this.isDark
    !this.isDark ? this.textTooltip = 'Mode clair' : this.textTooltip = 'Mode sombre'
  },

})
