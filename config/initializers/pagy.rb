require "pagy/extras/searchkick"
require "pagy/extras/bootstrap"

Searchkick.extend Pagy::Searchkick

Pagy::DEFAULT[:items] = 25
