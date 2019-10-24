class Container < ApplicationRecord

  belongs_to :user
  belongs_to :parent, class_name: 'Container', optional: true

  has_many :container_items

  def parents(who = self)
    @tree ||= []
    if who.parent.nil?
      return @tree
    else
      @tree << who.parent
      parents(who.parent)
    end
  end

  def children(who = self)
    @tree ||= []
    unless Container.find_by(parent_id: who.id).present?
      return @tree
    else
      @tree << Container.find_by(parent_id: who.id)
      children(Container.find_by(parent_id: who.id))
    end
    return @tree
  end

end
