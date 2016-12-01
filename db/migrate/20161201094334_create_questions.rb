class CreateQuestions < ActiveRecord::Migration
    def change
        create_table :questions do |t|
            t.string :question
            t.string :a
            t.string :b
            t.string :c
            t.string :d
            t.string :answer
            t.belongs_to :zones, index: true
            t.timestamps null: false
        end

        execute "ALTER TABLE questions ALTER created_at SET DEFAULT now()"
        execute "ALTER TABLE questions ALTER updated_at SET DEFAULT now()"
    end
end
