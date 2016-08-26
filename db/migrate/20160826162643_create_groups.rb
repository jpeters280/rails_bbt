class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :org_name
      t.string :description
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
