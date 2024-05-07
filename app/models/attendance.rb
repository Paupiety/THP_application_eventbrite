class Attendance < ApplicationRecord
    after_create :welcome_send

    validates :stripe_customer_id, presence: true
    belongs_to :user
    belongs_to :event

    def welcome_send()
        UserMailer.welcome_attendance(self).deliver_now
    end
end
