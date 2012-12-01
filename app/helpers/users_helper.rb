module UsersHelper
	 def tasks(user)
	 	user.tasks.collect(&:name).join(', ')
	 end
end
