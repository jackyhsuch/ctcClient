class CreateTowers < ActiveRecord::Migration
    def change
        create_table :towers do |t|
            t.string :name, unique: true
            t.timestamps null: false
        end

        execute "ALTER TABLE towers ALTER created_at SET DEFAULT now()"
        execute "ALTER TABLE towers ALTER updated_at SET DEFAULT now()"
    end
end
