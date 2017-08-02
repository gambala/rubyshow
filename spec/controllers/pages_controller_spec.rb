# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'GET #home' do
    before(:each) { get :home }

    it { is_expected.to render_template(:home) }
  end
end
