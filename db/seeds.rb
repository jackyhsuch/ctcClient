puts "********Seeding Data Start************"

admin = User.create(first_name: 'Wen Luo', last_name: 'Lau', 
		name: 'wenluo92', nationality: 'Singaporean', 
		date_of_birth: '1992-02-13', contact_number: 11111111, 
		email: 'wenluo92@hotmail.com', password_digest: 'wenluo92')

	User.create(first_name: 'Wei Tao', last_name: 'Soh', 
		name: 'wt87', nationality: 'Singaporean', 
		date_of_birth: '1987-10-15', contact_number: 22222222, 
		email: 'wt87@hotmail.com', password_digest: '87wt')

	User.create(first_name: 'Zie Hao', last_name: 'Kek', 
		name: 'zh91', nationality: 'Singaporean', 
		date_of_birth: '1991-01-18', contact_number: 33333333, 
		email: 'zh91@hotmail.com', password_digest: '91zh')

	User.create(first_name: 'Jason', last_name: 'Cheong', 
		name: 'jc91', nationality: 'Singaporean', 
		date_of_birth: '1991-06-12', contact_number: 44444444, 
		email: 'jc91@hotmail.com', password_digest: '91jc')

	User.create(first_name: 'Kah Seng', last_name: 'Lim', 
		name: 'ks91', nationality: 'Singaporean', 
		date_of_birth: '1991-08-23', contact_number: 55555555, 
		email: 'ks91@hotmail.com', password_digest: '91ks')
	
	Tower.create(name: 'IT')

	Tower.create(name: 'Business')
	
	Topic.create(name: 'Java', tower_id: 1)

	Topic.create(name: 'Ruby', tower_id: 1)

	Topic.create(name: 'Python', tower_id: 1)

	Zone.create(name: 'Zone of Trail', difficulty: 1, topic_id: 1)

	Zone.create(name: 'Zone of Insanity', difficulty: 2, topic_id: 1)

	Zone.create(name: 'Zone of Despair', difficulty: 3, topic_id: 1)

	Question.create(question: 'Given:
public class Calculator {
 int num = 100;
 public void calc(int num) {
 this.num = num * 10;
 }
 public void printNum(){
 System.out.println(num);
 }
 public static void main(String[] args) {
 Calculator obj = new Calculator ();
 obj.calc(2);
 obj.printNum();
 }
}
What is the result?',
			choice_A: '20', 
			choice_B: '100', 
			choice_C: '1000', 
			choice_D: '2', 
			answer: 'a')

	Question.create(question: 'Given:
public class MyStuff {
 String name;
 MyStuff(String n) {
 name = n;
 }
 public static void main(String[] args) {
 MyStuff m1 = new MyStuff("guitar");
 MyStuff m2 = new MyStuff("tv");
 System.out.println(m2.equals(m1));
 }
 public boolean equals(Object o) {
 MyStuff m = (MyStuff) o;
 if (m.name != null) {
 return true;
 }
 return false;
 }
}
What is the result?',
			choice_A: 'The output is true and MyStuff fulfills the Object.equals() contract.', 
			choice_B: 'The output is false and MyStuff fulfills the Object.equals() contract', 
			choice_C: 'The output is true and MyStuff does NOT fulfill the Object.equals() contract.', 
			choice_D: 'The output is false and MyStuff does NOT fulfill the Object.equals() contract.', 
			answer: 'c')
	
	Zones_Question.create(zone_id: 1, question_id: 1)

	Zones_Question.create(zone_id: 1, question_id: 2)
	

puts "********Seeding Data End************"



