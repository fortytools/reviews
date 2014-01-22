class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :username
      t.string :password
      t.boolean :remember_me

      t.timestamps
    end
  end
end
