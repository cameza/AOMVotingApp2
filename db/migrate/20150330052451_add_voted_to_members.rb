class AddVotedToMembers < ActiveRecord::Migration
  def change
    add_column :members, :voted, :boolean
  end
end
