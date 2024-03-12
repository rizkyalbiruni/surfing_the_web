class RenameTypeToBoardTypeInSurfboards < ActiveRecord::Migration[7.1]
  def change
    rename_column :surfboards, :type, :board_type
  end
end
