class User < ActiveRecord::Base
    has_many :teams
    has_secure_password
    validates_presence_of :username, :email, :password
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    
    def slug
        self.username.gsub(/\s+/, '-').downcase
    end
    
    def self.find_by_slug(slug)
        self.find do |user|
          user.slug == slug
        end
    end
end