class RenameJobReferenceIdInEmployment < ActiveRecord::Migration
  def up
		rename_column "employments", "job", "job_id" 
  end

  def down
		rename_column "employments", "job_id", "job" 
  end
end
