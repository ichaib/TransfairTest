class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :rating_servicepartner
      t.integer :job
      t.integer :service_partner_id

      t.timestamps
    end
  end
end
