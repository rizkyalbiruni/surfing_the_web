class ChangeDataTypeOfColumn < ActiveRecord::Migration[7.1]
  def change
    change_column :surfboards, :status, :integer, default: 0, using: 'status::integer'
  end
end
