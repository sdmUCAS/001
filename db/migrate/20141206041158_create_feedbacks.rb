class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :content
      t.date :date
      t.string :reply

      t.timestamps
    end
  end
end
