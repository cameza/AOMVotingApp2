class IncludeDefaultsToNominees < ActiveRecord::Migration
  def change
  	change_column_default(:nominees, :confirmed, 0)
  	change_column_default(:nominees, :not_confirmed, 0)
  	change_column_default(:nominees, :abstained, 0)
  end
end
