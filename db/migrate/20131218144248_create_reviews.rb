class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews, id: :uuid do |t|
      t.text :good
      t.text :bad
      t.text :goals
      t.text :company
      t.uuid :user_id, null: false
      t.uuid :review_id
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
