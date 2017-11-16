class CreateTixes < ActiveRecord::Migration[5.0]
  def change
    create_table :tixes do |t|
      t.date :date
      t.string :tag
      t.string :task
      t.string :comment
      t.string :priority
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
