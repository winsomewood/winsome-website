class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.column :itemno, :integer
      t.column :kit, :boolean
      t.column :upc, :string
      t.column :collection, :string
      t.column :description, :string
      t.column :category, :string
      t.column :finish, :string
      t.column :material, :string
      t.column :assembly, :boolean
      t.column :length, :string
      t.column :width, :string
      t.column :height, :string
      t.timestamps null: false
    end
    create_table :kits do |t|
      t.column :kitno, :integer
      t.column :itemno, :integer
      t.column :name, :string
      t.timestamps null: false
    end
  end
end
