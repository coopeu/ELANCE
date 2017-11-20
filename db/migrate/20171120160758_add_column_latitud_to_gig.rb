class AddColumnLatitudToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :latitude, :string
  end
end
