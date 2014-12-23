class CreateRetailers < ActiveRecord::Migration
  def change
    create_table :retailers do |t|
      t.column :name, :string
      t.column :src, :string
      t.column :url, :string
      t.timestamps null: false
    end
  end
end
