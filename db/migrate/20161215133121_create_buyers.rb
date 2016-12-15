class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.references :product, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
