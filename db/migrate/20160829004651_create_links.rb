class CreateLinks < ActiveRecord::Migration[5.0]
  def up
    create_table :links do |t|

      t.string 'url'
      t.string 'title'
      t.integer 'votes'

      # add relationships for user to links
      t.integer 'user_id'
      # add relationship for posts to links
      t.integer 'post_id'
      # add relationships for comments to links
      
      # add relationships for votes to links

      t.timestamps
    end
  end

  def down
  	drop_table :links
  end
end
