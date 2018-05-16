class MakeChangesToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :title, :name
    change_column :products, :description, :text

    change_column :products, :price, "numeric USING CAST(price AS numeric)" #changes from integer to decimal
    change_column :products, :price, :decimal, precision: 9, scale: 2 #applies precision and scale

    remove_column :products, :isbn, :string # in case you unremove it, it knows
    add_column :products, :active, :boolean, default: true
  end
end
