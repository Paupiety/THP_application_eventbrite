class Event < ApplicationRecord
    validates :start_date, presence: true
    validates :duration, presence: true, numericality: { only_integer: true, multiple_of: 5, greater_than: 0, }
    validates :title, presence: true, length: {in: 5..140}
    validates :description, presence: true, length: {in: 20..1000}
    validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 } 
    validates :location, presence: true 
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :user
    validate :start_must_be_before_end_date
    

    # def end_date()
    #     duration_sec = :duration * 60
    #     duration_datetime = Time.at(duration_sec).to_datetime
    #     return :start_date + duration_datetime
    # end

    def start_must_be_before_end_date()
        datetime_now = DateTime.now
        start_date = self.start_date
        errors.add(:start_date, "Tu veux vraiment finir tes vacances avant de les avoir terminées ?") if 
            start_date < datetime_now
    end 
end