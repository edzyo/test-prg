class ContainerSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at
  attribute(:parent) { object.try(:parent) }
  attribute(:clidren) {object.try(:children)}
  attribute(:user) { object.try(:user) }

  has_many :container_items, serializer: ContainerItemSerializer
end