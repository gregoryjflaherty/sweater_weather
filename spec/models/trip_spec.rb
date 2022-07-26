require 'rails_helper'

RSpec.describe Trip, type: :model do
    it { should have_many(:trip_users)}
    it { should have_many(:users).through(:trip_users)}
end
