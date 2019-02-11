class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :sn
      t.string :url
      t.float :lon
      t.float :lat
      t.timestamps
    end
  end
end
