class FixColumnName < ActiveRecord::Migration
  def up
		rename_column :beers, :type, :beer_type				
  end

  def down
		rename_column :beers, :beer_type, :type					
  end
end
