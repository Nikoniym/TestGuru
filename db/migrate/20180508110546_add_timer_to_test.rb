class AddTimerToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :timer, :integer
  end
end
