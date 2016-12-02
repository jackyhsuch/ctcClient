puts "********User Start************"

User.create(
	first_name: 'jacky', 
	last_name: 'hsu', 
	nationality: 'singaporean', 
	date_of_birth: '1991-01-02', 
	contact: 91734806, 
	email: 'jackyhsu0102@gmail.com', 
	password: 'password',
	password_confirmation: 'password')

User.create(
	first_name: 'jovio', 
	last_name: 'lim', 
	nationality: 'singaporean', 
	date_of_birth: '1991-04-20', 
	contact: 91734806, 
	email: 'jovio@gmail.com', 
	password: 'password',
	password_confirmation: 'password')

User.create(
	first_name: 'wenluo', 
	last_name: 'lau', 
	nationality: 'singaporean', 
	date_of_birth: '1992-02-13', 
	contact: 11111111, 
	email: 'wenluo@gmail.com', 
	password: 'password',
	password_confirmation: 'password')

User.create(
	first_name: 'weitao', 
	last_name: 'soh', 
	nationality: 'singaporean', 
	date_of_birth: '1987-10-15', 
	contact: 22222222, 
	email: 'weitao@gmail.com', 
	password: 'password',
	password_confirmation: 'password')

User.create(
	first_name: 'ziehao', 
	last_name: 'kek', 
	nationality: 'singaporean', 
	date_of_birth: '1991-01-18', 
	contact: 98675125, 
	email: 'ziehao@gmail.com', 
	password: 'password',
	password_confirmation: 'password')

User.create(
	first_name: 'jason', 
	last_name: 'cheong', 
	nationality: 'singaporean', 
	date_of_birth: '1991-06-12', 
	contact: 44444444, 
	email: 'jason@gmail.com', 
	password: 'password',
	password_confirmation: 'password')

puts "********User End************"


puts "********Tower Start************"

Tower.create(name: 'it')
Tower.create(name: 'business')

puts "********Tower End************"


puts "********Topic Start************"

towerId = Tower.where(name: 'it').first.id
Topic.create(name: 'java', towers_id: towerId)
Topic.create(name: 'ruby', towers_id: towerId)
Topic.create(name: 'python', towers_id: towerId)

towerId = Tower.where(name: 'business').first.id
Topic.create(name: 'finance', towers_id: towerId)
Topic.create(name: 'marketing', towers_id: towerId)
Topic.create(name: 'auditing', towers_id: towerId)

puts "********Topic End************"


puts "********Zone Start************"

topicId = Topic.where(name: 'java').first.id
Zone.create(name: 'test', difficulty: 1, topics_id: topicId)
Zone.create(name: 'trail', difficulty: 2, topics_id: topicId)
Zone.create(name: 'courage', difficulty: 3, topics_id: topicId)
Zone.create(name: 'insanity', difficulty: 4, topics_id: topicId)
Zone.create(name: 'despair', difficulty: 5, topics_id:topicId)

topicId = Topic.where(name: 'finance').first.id
Zone.create(name: 'trail', difficulty: 1, topics_id: topicId)
Zone.create(name: 'courage', difficulty: 2, topics_id:topicId)
Zone.create(name: 'madness', difficulty: 3, topics_id: topicId)
Zone.create(name: 'insanity', difficulty: 4, topics_id:topicId)

topicId = Topic.where(name: 'ruby').first.id
Zone.create(name: 'trail', difficulty: 1, topics_id: topicId)
Zone.create(name: 'courage', difficulty: 2, topics_id: topicId)
Zone.create(name: 'despair', difficulty: 3, topics_id:topicId)

puts "********Zone End************"


puts "********Question Start************"


topicId = Topic.where(name: 'java').first.id
zoneId = Zone.where(topics_id: topicId, name: 'test').first.id
Question.create(
	question: 'What is Java?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'a', zones_id: zoneId
)
Question.create(
	question: 'What is difference between JDK,JRE and JVM?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'd', zones_id: zoneId
)
Question.create(
	question: 'How many types of memory areas are allocated by JVM?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'b', zones_id: zoneId
)
zoneId = Zone.where(topics_id: topicId, name: 'trail').first.id
Question.create(
	question: 'What is classloader?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'd', zones_id: zoneId
)
Question.create(
	question: 'Is Empty .java file name a valid source file name?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'c', zones_id: zoneId
)
Question.create(
	question: 'What if I write static public void instead of public static void?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'c', zones_id: zoneId
)

topicId = Topic.where(name: 'finance').first.id
zoneId = Zone.where(topics_id: topicId, name: 'trail').first.id
Question.create(
	question: 'What is the cash flow statement?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'a', zones_id: zoneId
)
Question.create(
	question: 'What is working capital?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'd', zones_id: zoneId
)
Question.create(
	question: 'Is it possible for a company to show positive cash flows but be in grave trouble?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'b', zones_id: zoneId
)
zoneId = Zone.where(topics_id: topicId, name: 'courage').first.id
Question.create(
	question: 'How is it possible for a company to show positive net income but go bankrupt?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'd', zones_id: zoneId
)
Question.create(
	question: 'I buy a piece of equipment, walk me through the impact on the 3 financial statements.', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'c', zones_id: zoneId
)
Question.create(
	question: 'What is goodwill?', a: 'a', b: 'b', c: 'c', d: 'd', answer: 'c', zones_id: zoneId
)

puts "********Question End************"