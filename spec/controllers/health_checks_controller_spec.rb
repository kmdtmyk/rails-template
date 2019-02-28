require 'rails_helper'

RSpec.describe HealthChecksController, type: :controller do

  render_views

  describe '#show' do

    it do
      get :show
      expect(response.status).to eq 200
    end

  end

end
