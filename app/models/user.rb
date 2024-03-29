class User < ActiveRecord::Base
 attr_accessible :name,:tasks_attributes
 has_many :tasks
 accepts_nested_attributes_for :tasks
 def self.from_omniauth(auth)
 p "----------------------#{auth.inspect}"
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end
end
