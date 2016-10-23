class ZonesQuestions < ActiveRecord::Migration
  
	
	def change
  
		
		create_table :zones, force: :cascade do |t|
			t.string :name
			t.integer :difficulty
			t.belongs_to :topic,	class_name: "AddUsersTowersTopicsTables",
						foreign_key: "id"
			t.timestamps null: false
		end

		execute "ALTER TABLE zones ALTER created_at SET DEFAULT now()"
		execute "ALTER TABLE zones ALTER updated_at SET DEFAULT now()"

		create_table :questions, force: :cascade do |t|
			t.string :question
			t.string :choice_A
			t.string :choice_B
			t.string :choice_C
			t.string :choice_D
			t.string :answer
			t.timestamps null: false
		end

		execute "ALTER TABLE questions ALTER created_at SET DEFAULT now()"
		execute "ALTER TABLE questions ALTER updated_at SET DEFAULT now()"

		create_table :zones_questions, id: false do |t|
			t.belongs_to :zone, index: true
			t.belongs_to :question, index: true
			t.timestamps null: false
		end

		execute "ALTER TABLE zones_questions ALTER created_at SET DEFAULT now()"
		execute "ALTER TABLE zones_questions ALTER updated_at SET DEFAULT now()"



	end

end
