class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :type
      t.text :description
      t.integer :user_id

      t.timestamps
    end
		add_index :beers, [:user_id, :created_at]
  end
end
