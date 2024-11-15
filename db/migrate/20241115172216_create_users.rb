class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps

      t.index :uid, unique: true
    end
  end
end
