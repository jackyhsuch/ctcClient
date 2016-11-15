class CreateProgresses < ActiveRecord::Migration
    def change
        create_table :progresses do |t|
            t.belongs_to :users, index: true
            t.belongs_to :topics, index: true

            t.integer :question_id
            t.integer :lives
            t.integer :level

            t.timestamps null: false
        end

        execute "ALTER TABLE progresses ALTER created_at SET DEFAULT now()"
        execute "ALTER TABLE progresses ALTER updated_at SET DEFAULT now()"
    end
end
