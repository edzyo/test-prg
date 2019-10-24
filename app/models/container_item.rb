class ContainerItem < ApplicationRecord


  belongs_to :container
  validate :my_validation
  def my_validation
   if ContainerItem.where(container_id: self.container_id, name: self.name).present?
    errors.add(:name, "cant save container item with same name in one container")
   end
  end


  def move_to(other_container)
    self.update(container_id: other_container.id) unless other_container.container_items.find_by(name: self.name).present?
  end

  def copy_to(other_container)
    other_container.container_items.create(name: self.name) unless other_container.container_items.find_by(name: self.name).present?
  end

end
