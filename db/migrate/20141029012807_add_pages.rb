class AddPages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.integer :charity_id

      t.timestamps
    end

    add_index :pages, :charity_id
  end
end
