class User < ActiveRecord::Base

<<<<<<< HEAD
	before_save {self.email = email.downcase}
	before_save {self.name = name.downcase}

	#validate username
	validates :name, presence: true, length: { maximum: 50 },
				uniqueness: { case_sensitive: false }

	#validate email

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
				format: { with: VALID_EMAIL_REGEX},
				uniqueness: { case_sensitive: false }

	
	has_secure_password
	#validate password
	validates :password, presence: true, length: { minimum: 6 }

	# Returns the hash digest of the given string.
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
		                                          BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

=======
>>>>>>> refs/remotes/origin/database-seeds
end
