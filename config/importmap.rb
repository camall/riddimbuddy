# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "moment", to: "https://ga.jspm.io/npm:moment@2.29.4/moment.js"
pin "tone", to: "https://ga.jspm.io/npm:tone@14.7.77/build/Tone.js"
