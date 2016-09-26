class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|

    t.string 'username', :limit=>25
    t.string 'email'
    t.string 'password'

    # add relationships for user to posts
    # add relationships for user to comments
    # add relationships for user to links

    t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
