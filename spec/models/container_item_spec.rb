require 'rails_helper'

RSpec.describe ContainerItem, type: :model do
  let!(:container) { create(:container) }
  let!(:container_item) { create(:container_item, container: container) }

  describe '#move_to' do
    subject { container_item.move_to(target_container) }

    let(:target_container) { create(:container) }


    context 'when target container is empty' do

      it { is_expected.to be_truthy }

      it 'adds container item to target container' do
        expect { subject }.to change { target_container.container_items.count }.by(1)
      end

      it 'removes container item from original container' do
        expect { subject }.to change { container.container_items.count }.by(-1)
      end
    end

    context 'when target container already has item with the same name' do
      let!(:similar_container_item) { create(:container_item, name: container_item.name) }

      it { expect { subject }.to raise_error }
    end
  end

  describe '#copy_to' do
    subject { container_item.copy_to(target_container) }

    let(:target_container) { create(:container) }

    context 'when target container is empty' do
      it { is_expected.to be_truthy }

      it 'adds container item to target container' do
        expect { subject }.to change { target_container.container_items.count }.by(1)
      end
    end

    context 'when target container already has item with the same name' do
      let!(:similar_container_item) { create(:container_item, name: container_item.name) }

      it { expect { subject }.to raise_error }
    end
  end


end
