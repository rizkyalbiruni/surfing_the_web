class RenameOldColumnToNewColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :surfboards, :availiblity, :status
  end
end
