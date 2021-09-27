module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      features: {
        'nesting-rules': true
      },
      stage: 3
    }),
    require('autoprefixer'),
    require('tailwindcss/nesting'),
    require('tailwindcss')('./tailwind.config.js'),
  ]
}
