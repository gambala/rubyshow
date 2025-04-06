require "pagy/extras/overflow"
require "pagy/extras/trim"

Pagy::I18n.load({ locale: 'ru' })
Pagy::DEFAULT[:overflow] = :last_page
Pagy::DEFAULT.freeze
