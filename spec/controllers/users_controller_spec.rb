# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }

  describe 'GET #show' do
    before(:each) { get :show, params: { id: user.id } }

    it { is_expected.to render_template(:show) }
  end
end
