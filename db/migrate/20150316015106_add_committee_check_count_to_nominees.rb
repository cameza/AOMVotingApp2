class AddCommitteeCheckCountToNominees < ActiveRecord::Migration
  def change
    add_column :nominees, :committee_check_count, :integer
  end
end
