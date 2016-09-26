class CreatePostsSubradditsJoins < ActiveRecord::Migration[5.0]
  def up
    create_table :posts_subraddits, :id=>false do |t|

    	t.integer 'post_id'
    	t.integer 'subraddit_id'
      t.timestamps
    end

    add_index :posts_subraddits, ['post_id','subraddit_id']
    
  end

  def down
  	drop_table :posts_subraddits
  end

end
