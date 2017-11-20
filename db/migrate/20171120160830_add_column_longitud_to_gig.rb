class AddColumnLongitudToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :longitude, :string
  end
end
