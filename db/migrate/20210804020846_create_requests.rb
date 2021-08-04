class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|

      t.string     :title,   null: false
      t.text       :content, null: false
      t.references :room,    null: false, foreign_key: true
      t.references :user,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
