class AddUserToTests < ActiveRecord::Migration[5.1]
  def change
    # add_reference :tests, :user, foreign_key: true, as: :author_id
    # add_column :tests, :author_id, :integer, index: true
    # add_foreign_key :tests, :users, column: :author_id
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end
