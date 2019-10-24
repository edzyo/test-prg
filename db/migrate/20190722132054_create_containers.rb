class CreateContainers < ActiveRecord::Migration[5.2]

  def change
    create_table :containers do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :parent, null: true, index: true
      t.string :name
      t.timestamps
    end
  end

end
