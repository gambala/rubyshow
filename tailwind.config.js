const colors = require('tailwindcss/colors');

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
  variants: {
    gradientColorStops: ['responsive', 'hover', 'focus', 'active'],
  },
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      gray: colors.coolGray,
      red: colors.red,
      orange: colors.orange,
      yellow: colors.amber,
      green: colors.green,
      teal: colors.teal,
      blue: colors.blue,
      indigo: colors.indigo,
      purple: colors.purple,
    },
    fontSize: {
      'xs':   ['0.75rem', '1rem'],
      'sm':   ['0.875rem', '1.25rem'],
      'base': ['1rem', '1.5rem'],
      'lg':   ['1.125rem', '1.75rem'],
      'xl':   ['1.25rem', '1.75rem'],
      '2xl':  ['1.5rem', '2rem'],
      '3xl':  ['1.875rem', '2.25rem'],
      '4xl':  ['2.25rem', '2.5rem'],
      '5xl':  ['3rem', '1.17'],
      '6xl':  ['3.75rem', '1.17'],
      '7xl':  ['4.5rem', '1.17'],
      '8xl':  ['6rem', '1.17'],
      '9xl':  ['8rem', '1.17'],
    },
    screens: {
      'sm': '640px',
      'md': '768px',
      'lg': '1024px',
      'xl': '1280px',
      '2xl': '1536px',
    },
  },
}
