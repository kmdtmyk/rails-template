require 'rails_helper'

RSpec.describe Theme::BootstrapHelper, type: :helper do

  describe 'date_field' do
    it do
      expect(date_field).to include('form-control')
    end
  end

  describe 'datetime_field' do
    it do
      expect(datetime_field).to include('form-control')
    end
  end

  describe 'number_field' do
    it do
      expect(number_field).to include('form-control')
    end
  end

  describe 'password_field' do
    it do
      expect(password_field).to include('form-control')
    end
  end

  describe 'search_field' do
    it do
      expect(search_field).to include('form-control')
    end
  end

  describe 'text_area' do
    it do
      expect(text_area).to include('form-control')
    end
  end

  describe 'text_field' do
    it do
      expect(text_field).to include('form-control')
    end
  end

  describe 'text_field_tag' do
    it do
      expect(text_field_tag).to include('form-control')
    end
  end

  describe 'select' do
    it do
      expect(select).to include('form-control')
    end
  end

  describe 'select_tag' do
    it do
      expect(select_tag).to include('form-control')
    end
  end

  describe 'submit_tag' do
    it do
      expect(submit_tag).to include('btn btn-primary')
    end
  end

end
