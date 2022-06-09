module.exports = {
  mode: "jit",
  darkMode: "class",
  purge: [
    "./resources/views/**/*.edge",
    "./resources/assets/ts/**/*.ts",
    "./resources/assets/js/**/*.js",
  ],
  content: [],
  theme: {
    extend: {
      colors: {
        fc: "#E5EEFD",
        fcl: "#004CA3",
        fcb: "#ffffff",
        inc: "#E5EEFD",
        ac: "#FF6A00",
        ahc: "#FF9900",
        ipc: "#5E12FF",
        fd: "#001537",
        fdl: "#004CA3",
        fdb: "#313131",
        ind: "#001537",
        ad: "#FF9900",
        ahd: "#FF6A00",
        ipd: "#5E12FF",
      },
      fontFamily: {
        body: ["Open sans", "sans-serif"],
      },
      fontSize: {
        "truc-size": "25rem",
      },
    },
  },
  plugins: [],
};
