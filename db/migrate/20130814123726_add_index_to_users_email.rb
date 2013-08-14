class AddIndexToUsersEmail < ActiveRecord::Migration
	# index for a database inforcing uniqness
  def change
  	add_index :users, :email, unique: true 
  end
end
