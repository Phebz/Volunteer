require 'rails_helper'

RSpec.describe Mission, type: :model do
  let(:organization) { build(:organization) }
  let(:user) { build(:user) }
  let(:mission) { build(:mission, organization_id: organization.id, user_id: user.id) }
  
  describe 'Active Records Validations' do
    it { should belong_to(:user).optional }
    it { should belong_to(:organization) }
    it { should have_many(:working_days).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name).ignoring_case_sensitivity }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:capacity) }
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_numericality_of(:capacity).is_greater_than(0) }
    it { should validate_numericality_of(:capacity).is_only_integer(true) }
  end

  describe 'Validations Date formats' do
    it { should allow_value(DateTime.now).for(:start_date) }
    it { should allow_value(DateTime.now).for(:end_date) }
    it { should_not allow('31/12/2020').for(:start_date) }
    it { should_not allow('Text').for(:end_date) }
    it { should_not allow(31_122_020).for(:start_date) }
    it { should_not allow(31_122_020).for(:end_date) }
  end

  describe 'When start_date is superior at end_date' do
    before { allow(mission).to receive(:right_order_of_dates?).and_return(false) }
    expect(mission).to_not be_valid
    before { allow(mission).to receive(:right_order_of_dates?).and_return(true) }
    expect(mission).to be_valid
  end
end
