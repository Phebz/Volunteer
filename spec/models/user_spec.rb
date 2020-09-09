require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'Active Record Associations' do
    it { should have_many(:organizations).dependent(:nullify) }
    it { should have_many(:missions).dependent(:nullify) }
    it { should belong_to(:organization).optional }
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:user_type) }
    it { should validate_uniqueness_of(:first_name).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:last_name).ignoring_case_sensitivity }
    it { should validate_inclusion_of(:user_type).in_array(%w[admin_organization user_organization volunteer]) }
  end

  describe 'Validations email' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to_not allow_value('blah').for(:email) }
    it { is_expected.to_not allow_value('').for(:email) }
    it { is_expected.to allow_value('a@b.com').for(:email) }
    it { is_expected.to allow_value('valentin@gmail.com').for(:email) }
    it { is_expected.to allow_value('a233445b@bonjour.com').for(:email) }
  end

  describe 'full_name method' do
    it { expect(user.full_name).to eq('John Doe') }
    it { expect(user.email).to eq('john@doe') }
  end
end
