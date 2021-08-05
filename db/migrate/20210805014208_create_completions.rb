class CreateCompletions < ActiveRecord::Migration[6.0]
  def change
    create_table :completions do |t|

      t.references :user, null: false, foreign_key: true
      t.references :request, null: false, foreign_key: true
      t.timestamps
    end
  end
end
