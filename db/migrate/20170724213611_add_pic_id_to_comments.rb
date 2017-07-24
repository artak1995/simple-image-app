class AddPicIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pic_id, :integer
    add_index :comments, :pic_id
  end
end
