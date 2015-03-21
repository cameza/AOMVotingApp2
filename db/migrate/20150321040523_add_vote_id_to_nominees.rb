class AddVoteIdToNominees < ActiveRecord::Migration
  def change
  	add_column :nominees, :vote_id, :integer
  end
end
