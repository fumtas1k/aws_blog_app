class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.string :title, null: false, limit: 20
      t.text :content, null: false

      t.timestamps
    end
  end
end
