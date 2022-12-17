class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
    add_reference :groups, :user, index: true 
  end
end
