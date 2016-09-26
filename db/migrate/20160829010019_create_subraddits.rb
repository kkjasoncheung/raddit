class CreateSubraddits < ActiveRecord::Migration[5.0]
  def change
    create_table :subraddits do |t|
      t.string 'title'
      t.timestamps
    end
  end
end
