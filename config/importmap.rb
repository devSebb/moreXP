# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@2.4.1/dist/flowbite.turbo.min.js"
pin "anime", to: "https://cdn.skypack.dev/animejs@3.2.1"
pin "home_animation", to: "home_animation.js", preload: true
pin "path_animation", to: "path_animation.js", preload: true
