class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.integer :contact_id
      t.text :convo
      t.date :date

      t.timestamps
    end
  end
end
