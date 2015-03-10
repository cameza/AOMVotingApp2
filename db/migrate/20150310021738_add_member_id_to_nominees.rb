class AddMemberIdToNominees < ActiveRecord::Migration
  def change
    add_column :nominees, :member_id, :integer
  end
end
