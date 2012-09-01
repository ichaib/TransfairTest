class CreateServicePartners < ActiveRecord::Migration
  def change
    create_table :service_partners do |t|

      t.timestamps
    end
  end
end
