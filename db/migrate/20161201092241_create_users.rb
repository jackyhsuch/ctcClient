class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.string :first_name
            t.string :last_name
            t.string :password_digest
            t.string :nationality
            t.date :date_of_birth
            t.integer :contact
            t.string :email, unique: true
            t.timestamps null: false
        end

        execute "ALTER TABLE users ALTER created_at SET DEFAULT now()"
        execute "ALTER TABLE users ALTER updated_at SET DEFAULT now()"
    end
end
