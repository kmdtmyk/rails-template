# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do

  describe 'safe_order' do

    it 'string' do
      expect(Book.safe_order('name', 'asc').to_sql).to include 'ORDER BY books.name ASC'
      expect(Book.safe_order('name', 'desc').to_sql).to include 'ORDER BY books.name DESC'
    end

    it 'symbol' do
      expect(Book.safe_order(:name, :asc).to_sql).to include 'ORDER BY books.name ASC'
      expect(Book.safe_order(:name, :desc).to_sql).to include 'ORDER BY books.name DESC'
    end

    it 'ignore case' do
      expect(Book.safe_order('NAME', 'ASC').to_sql).to include 'ORDER BY books.name ASC'
      expect(Book.safe_order('NAME', 'DESC').to_sql).to include 'ORDER BY books.name DESC'
      expect(Book.safe_order(:NAME, :ASC).to_sql).to include 'ORDER BY books.name ASC'
      expect(Book.safe_order(:NAME, :DESC).to_sql).to include 'ORDER BY books.name DESC'
    end

    it 'one argument' do
      expect(Book.safe_order('name').to_sql).to include 'ORDER BY books.name ASC'
    end

    it 'invalid argument' do
      expect(Book.safe_order('foo', 'asc').to_sql).not_to include 'ORDER BY'
      expect(Book.safe_order('name', 'foo').to_sql).not_to include 'ORDER BY'
      expect(Book.safe_order(nil, nil).to_sql).not_to include 'ORDER BY'
    end

  end


end
