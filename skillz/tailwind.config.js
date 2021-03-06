module.exports = {
  mode: 'jit',
  darkMode: 'class',
  purge: [
    './resources/views/**/*.edge',
    './resources/assets/ts/**/*.ts',
    './resources/assets/js/**/*.js',
  ],
  content: [],
  theme: {
    extend: {
      colors: {
        fc: '#E5EEFD',
        fcl: '#004CA3',
        fcb: '#ffffff',
        inc: '#E5EEFD',
        ac: '#FF6A00',
        ahc: '#FF9900',
        ipc: '#5E12FF',
        ihc: '#DEDEDE',
        fd: '#001537',
        fdl: '#004CA3',
        fdb: '#004CA3',
        ind: '#001537',
        ad: '#FF9900',
        ahd: '#FF6A00',
        ipd: '#00E5FF',
        ihd: '#000000',
      },
      fontSize: {
        '2xs': '0.688rem',
      },
    },
  },
  plugins: [],
}
