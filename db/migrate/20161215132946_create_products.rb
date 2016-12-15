class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.boolean :bought
      t.references :user, index: true

      t.timestamps
    end
  end
end
