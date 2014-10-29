class AddCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :tax_number
      t.boolean :active

      t.timestamps
    end

    add_index :charities, :tax_number
    add_index :charities, [:tax_number, :active]
  end
end
