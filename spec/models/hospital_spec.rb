require 'rails_helper'

RSpec.describe Hospital, type: :model do
  it { should have_many :doctors }
  it { should have_many(:patients).through(:doctors) }
end
