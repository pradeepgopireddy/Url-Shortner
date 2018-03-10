class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.integer :shortened_url_id
      t.string :browser_name
      t.string :operating_system
      t.string :device_name

      t.timestamps
    end
  end
end
