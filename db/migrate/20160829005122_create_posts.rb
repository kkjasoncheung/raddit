class CreatePosts < ActiveRecord::Migration[5.0]
  def up
    create_table :posts do |t|

      t.string 'title'
	    t.integer 'votes'
	    t.text 'content'
	  # add relationships for links to posts
      # add relationships for comments to posts
      # add relationships for user that created it
      t.references :user

      t.timestamps

    end
  end

  def down
  	drop_table :posts
  end
end
