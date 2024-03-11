class CreateSurfboards < ActiveRecord::Migration[7.1]
  def change
    create_table :surfboards do |t|
      t.string :type
      t.string :img_url
      t.text :description
      t.string :availiblity
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
