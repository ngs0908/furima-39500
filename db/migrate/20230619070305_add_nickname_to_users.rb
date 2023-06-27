class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|

      t.string  :nickname, null: false
      t.string  :last_name, null: false
      t.string  :first_name, null: false
      t.string  :last_name_kana, null: false
      t.string  :first_name_kana, null: false
      t.date   :date_of_birth, null: false

      t.timestamps
    end
  end
end
