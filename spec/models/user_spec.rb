# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'safe_order' do

    it 'string' do
      expect(User.safe_order('name', 'asc').to_sql).to include 'ORDER BY users.name ASC NULLS LAST'
      expect(User.safe_order('name', 'desc').to_sql).to include 'ORDER BY users.name DESC NULLS LAST'
    end

    it 'symbol' do
      expect(User.safe_order(:name, :asc).to_sql).to include 'ORDER BY users.name ASC NULLS LAST'
      expect(User.safe_order(:name, :desc).to_sql).to include 'ORDER BY users.name DESC NULLS LAST'
    end

    it 'ignore case' do
      expect(User.safe_order('NaMe', 'AsC').to_sql).to include 'ORDER BY users.name ASC NULLS LAST'
      expect(User.safe_order('NaMe', 'DeSc').to_sql).to include 'ORDER BY users.name DESC NULLS LAST'
      expect(User.safe_order(:nAmE, :aSc).to_sql).to include 'ORDER BY users.name ASC NULLS LAST'
      expect(User.safe_order(:nAmE, :dEsC).to_sql).to include 'ORDER BY users.name DESC NULLS LAST'
    end

    it 'one argument' do
      expect(User.safe_order('name').to_sql).to include 'ORDER BY users.name ASC NULLS LAST'
    end

    it 'invalid argument' do
      expect(User.safe_order('foo', 'asc').to_sql).not_to include 'ORDER BY'
      expect(User.safe_order('name', 'foo').to_sql).not_to include 'ORDER BY'
      expect(User.safe_order(nil, nil).to_sql).not_to include 'ORDER BY'
    end

  end


end