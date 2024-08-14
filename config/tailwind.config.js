const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'primary-orange': '#F59033',
        'custom-blue': 'rgb(4, 39, 62)',
        // 'yellow': '#FDE047',
        // 'blue': '#3B82F6',
        // 'green': '#34D399',
        // 'red': '#F87171',
        // 'sky': '#60A5FA',
        // 'indigo': '#6366F1',
        // 'cyan': '#22D3EE'
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        special: ['Permanent Marker', 'sans-serif']
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin')
  ]
}
