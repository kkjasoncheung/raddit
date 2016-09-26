class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|

	  t.string 'content'
	  t.integer 'votes'
	  t.integer 'post_id'
	  t.integer 'user_id'
	  t.integer 'link_id'
      t.timestamps
    end
  end
end
