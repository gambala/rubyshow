# frozen_string_literal: true

module Web
  class ApplicationController < ::ApplicationController
    include WithMobileViews

    before_action :check_for_mobile
  end
end
