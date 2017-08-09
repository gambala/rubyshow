# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe 'GET #index' do
    before(:each) { get :index }

    it { is_expected.to render_template(:index) }
  end
end
