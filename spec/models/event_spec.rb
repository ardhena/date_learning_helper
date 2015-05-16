require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_length_of(:name).is_at_most(255) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should belong_to :topic }

  describe 'default scope' do
    let(:event1) { Event.create(name: 'foo1', start_date: '2015-02-01', end_date: '2015-02-14') }
    let(:event2) { Event.create(name: 'foo2', start_date: '2015-02-01', end_date: '2015-02-05') }
    let(:event3) { Event.create(name: 'foo3', start_date: '2015-01-01', end_date: '2015-02-01') }

    it 'returns events in ascending order by start_date then end_date' do
      expect(Event.all).to eq([event3, event2, event1])
    end
  end

end
