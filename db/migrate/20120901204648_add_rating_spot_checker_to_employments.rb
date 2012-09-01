class AddRatingSpotCheckerToEmployments < ActiveRecord::Migration
  def change
    add_column :employments, :rating_spot_checker, :integer
  end
end
