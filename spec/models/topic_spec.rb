require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should have_many :events }
  it { should belong_to :user }

  describe 'default scope' do
    let(:topic1) { Topic.create(name: 'zzz') }
    let(:topic2) { Topic.create(name: 'aaa') }

    it 'returns topics in ascending order by name' do
      expect(Topic.all).to eq([topic2, topic1])
    end
  end
end
