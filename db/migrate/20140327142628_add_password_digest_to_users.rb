class AddPasswordDigestToUsers < ActiveRecord::Migration
  def up
    add_column :users, :password_digest, :string
    remove_column :users, :password_hash
  end

  def down
    add_column :users, :password_hash, :string
    remove_column :users, :password_digest
  end
end
