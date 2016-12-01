class CreateZones < ActiveRecord::Migration
    def change
        create_table :zones do |t|
            t.string :name
            t.integer :difficulty
            t.belongs_to :topics, index: true
            t.timestamps null: false
        end

        execute "ALTER TABLE zones ALTER created_at SET DEFAULT now()"
        execute "ALTER TABLE zones ALTER updated_at SET DEFAULT now()"
    end
end
