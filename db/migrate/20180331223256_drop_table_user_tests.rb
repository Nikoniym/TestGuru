class DropTableUserTests < ActiveRecord::Migration[5.1]
  def up
    drop_table :user_tests, if_exists: true
  end
end
