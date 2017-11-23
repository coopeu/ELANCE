class AddColumnSkillListToGig < ActiveRecord::Migration[5.1]
  def up
    add_column :gigs, :skill_list, :string
  end
  def down
  	remove_column: :gigs, :skill_list
end
