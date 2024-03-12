class AddAvailibilityToSurfboards < ActiveRecord::Migration[7.1]
  def change
    add_column :surfboards, :availibility, :date
  end
end
