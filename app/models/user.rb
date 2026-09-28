class User < ApplicationRecord
    validates :username ,presence: true, uniqueness: {case_sensitive: false}, length: { 
               minimum:3, maximum:25 ,
               too_short: "%<count>s characters is the minimum allowed",
               too_long: "%<count>s characters is the maximum allowed"
    }
    # if: :check?
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:true, 
                      uniqueness: { case_sensitive: false }, 
                      length:{ maximum: 105},
                      format: { with: VALID_EMAIL_REGEX }
    # def check?
    #     puts "Iam in check method"
    #     username&.start_with?("X")
    # end

    after_find do |user|
        Rails.logger.info "User #{user.username} was found"
    end
end