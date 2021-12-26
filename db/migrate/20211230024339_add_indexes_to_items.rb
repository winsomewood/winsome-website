class AddIndexesToItems < ActiveRecord::Migration[6.1]
  def change
    add_index :items, :itemno
    add_index :items, :collection
    add_index :items, :category
    add_index :items, :description
  end
end
