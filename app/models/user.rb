class User < ActiveRecord::Base
  
   validates :email, :presence => {:message => "User Name cannot be blank"}, :uniqueness=>{:message=>"This user name already exists"}
   validates :password_digest, :presence => {:message => "Password cannot be blank"}
   validates :salt, :presence => {:message => "Password cannot be blank"}
   validates :password, :confirmation => {:message => "Passwords must match"}

	def password_valid?(pw)
		Digest::SHA1.hexdigest(pw + self.salt.to_s).eql?(self.password_digest)
	end

	def password
		@password
	end

	def password=(pw)
		@password = pw
		self.salt = (Random.new.rand*10000).to_i
		self.password_digest = Digest::SHA1.hexdigest(pw + self.salt.to_s)
	end

	def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
