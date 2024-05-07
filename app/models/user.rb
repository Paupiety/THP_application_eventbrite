class User < ApplicationRecord
    after_create :welcome_send

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Une adresse valide s'il vous paît" }
    validates :description, presence: true, length: {in: 20..1000}
    validates :first_name, presence: true
    validates :last_name, presence: true
    has_many :attendances
    has_many :events, through: :attendances
    has_many :events

    def welcome_send()
        UserMailer.welcome_email(self).deliver_now
    end
end