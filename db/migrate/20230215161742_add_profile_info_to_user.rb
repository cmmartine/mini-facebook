class AddProfileInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_information, :text
  end
end
