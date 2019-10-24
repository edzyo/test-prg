require 'rails_helper'

RSpec.describe Container, type: :model do
#rewrite create variables
  let!(:first_container) { create(:container) }
  let!(:second_container) { create(:container, parent: first_container) }
  let!(:third_container) { create(:container, parent: second_container) }
  let!(:child_container) { create(:container, parent: third_container) }

  describe '#parents' do
    subject { child_container.parents }

    it { is_expected.to match_array [third_container, second_container, first_container] }
  end

  describe '#children' do
    subject { first_container.children }
    it do
      is_expected.to match_array [second_container, third_container, child_container]
    end
  end

end
