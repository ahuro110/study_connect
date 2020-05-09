class CreatePostStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :post_studies do |t|
      t.date :date
      t.text :content
      t.integer :study_hour
      t.integer :study_minute
      t.text :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
