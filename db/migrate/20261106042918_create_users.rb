class CreateSupportRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :support_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :category, null: false
      t.text :description, null: false
      t.string :address, null: false
      t.string :status, null: false, default: "未対応"

      t.timestamps
    end
  end
end