class AddDetailsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :blog_id, :integer
  end
end
