module.exports = {
  corePlugins: {
    container: false,
    preflight: false,
  },
  purge: [
    './app/views/**/*.erb',
    './app/views/**/*.html',
    './app/views/**/*.slim',
    './frontend/**/*.js',
  ],
  theme: {
    screens: {
      sm: '640px',
      md: '768px',
      lg: '1024px',
      xl: '1280px',
    },
  },
}
