# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  render_views

  describe '#index' do

    it do
      get :index
      expect(response.status).to eq 200
      expect(response).to render_template :index
    end

  end

end
