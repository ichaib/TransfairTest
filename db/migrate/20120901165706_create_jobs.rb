class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :rating_client

      t.timestamps
    end
  end
end
