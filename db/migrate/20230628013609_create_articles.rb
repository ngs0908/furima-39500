class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false
    end

    create_table :conditions do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false
    end

    create_table :delivery_charges do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false
    end

    create_table :prefectures do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false
    end

    create_table :ship_dates do |t|
      t.string :name, null: false
      t.integer :genre_id, null: false
    end
  end
end
