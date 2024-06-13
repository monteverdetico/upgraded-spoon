# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(build(:author)).to be_valid
    end

    it 'is invalid without a name' do
      expect(build(:author, name: '')).not_to be_valid
    end
  end
end
