# Pin npm packages by running ./bin/importmap

pin_all_from File.expand_path("../app/javascript", __dir__)
pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
