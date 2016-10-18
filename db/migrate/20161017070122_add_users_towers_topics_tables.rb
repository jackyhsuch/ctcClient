class Add_users_towers_topics_tables < ActiveRecord::Migration

	def change

		create_table :towers, force: :cascade do |t|
			t.string :name, unique: true
			t.timestamps null: false
		end

		execute "ALTER TABLE towers ALTER created_at SET DEFAULT now()"
		execute "ALTER TABLE towers ALTER updated_at SET DEFAULT now()"

		create_table :topics, force: :cascade do |t|
			t.string :name
			t.belongs_to :tower,	class_name: "Database",
						foreign_key: "id"
			t.timestamps null: false
		end

		execute "ALTER TABLE topics ALTER created_at SET DEFAULT now()"
		execute "ALTER TABLE topics ALTER updated_at SET DEFAULT now()"

		create_table :users, force: :cascade do |t|
			t.string :first_name
			t.string :last_name
			t.string :name, unique: true
			t.string :password_digest
			t.string :nationality
			t.date :date_of_birth
			t.integer :contact_number
			t.string :email_address
			t.timestamps null: false
		end

		execute "ALTER TABLE users ALTER created_at SET DEFAULT now()"
		execute "ALTER TABLE users ALTER updated_at SET DEFAULT now()"
	end

end
