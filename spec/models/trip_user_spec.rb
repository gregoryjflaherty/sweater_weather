require 'rails_helper'

RSpec.describe TripUser, type: :model do
  describe 'attributes' do
    it { should define_enum_for(:role) }
    it { should define_enum_for(:invite_status) }
  end

  describe 'relationships' do
    it { should belong_to(:user)}
    it { should belong_to(:trip)}
  end
end
