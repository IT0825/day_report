class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string      :title, limit: 30, null: false
      t.text        :text,   null: false
      t.references :user,   null: false, foreign_key:true
      t.timestamps
    end
  end
end
