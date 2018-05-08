class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :image_url
      t.string :rule
      t.string :level
      t.string :category

      t.timestamps
    end
  end
end
