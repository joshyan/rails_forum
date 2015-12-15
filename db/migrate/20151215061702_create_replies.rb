class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :title
      t.text :description
      t.belongs_to :user
      t.belongs_to :post
      t.timestamps
    end
  end
end
