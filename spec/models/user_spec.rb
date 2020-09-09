require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it { should have_many(:organizations).dependent(:nullify) }
    it { should have_many(:missions).dependent(:nullify) }
    it { should belong_to(:organization).optional }
    
    it { should validate_presence_of(:user_type) }

    it { should validate_inclusion_of(:user_type).in_array(%w[admin_organization user_organization volunteer]) }
  end

  describe 'Full name method' do
    user_test = User.create(first_name: 'Valentin', last_name: 'Birault')
    it { expect(user_test.full_name).to eq('Valentin Birault') }
  end
end
