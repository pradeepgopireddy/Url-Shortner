class AddColomnToLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :user_id, :integer
  end
end
