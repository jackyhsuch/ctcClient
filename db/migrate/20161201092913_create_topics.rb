class CreateTopics < ActiveRecord::Migration
    def change
        create_table :topics do |t|
            t.string :name
            t.belongs_to :towers, index: true
            t.timestamps null: false
        end

        execute "ALTER TABLE topics ALTER created_at SET DEFAULT now()"
        execute "ALTER TABLE topics ALTER updated_at SET DEFAULT now()"
    end
end
