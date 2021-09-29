class User < ApplicationRecord
    has_secure_password
    has_many :cats


    def total_cats
        User.find(self.id).cats.length
    end
end
