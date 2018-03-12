class AddColumnDefaultToTestsAndAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :correct, :boolean, default:  false
    change_column_null(:answers, :correct, false)
    change_column_default :tests, :level, from: nil, to: 1
  end
end
