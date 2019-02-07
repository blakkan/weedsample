class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.text :entry

      t.timestamps
    end
  end
end
