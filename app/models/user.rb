class User < ActiveRecord::Base

	class CreateUsers < ActiveRecord::Migration
 
		def change
			create_table :users do |t|
				# Devise fields

				## Database authenticatable
				t.string :email, :null => false
				t.string :encrypted_password, :null => false, :default => ""

				## Recoverable
				t.string   :reset_password_token
				t.datetime :reset_password_sent_at

				## Rememberable
				t.datetime :remember_created_at

				t.timestamps
			end

			add_index :users, :login, :unique => true
			add_index :users, :reset_password_token, :unique => true

		end
	end
end