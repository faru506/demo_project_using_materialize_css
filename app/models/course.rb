class Course < ApplicationRecord
    validates :short_name, presence: true, length: { minimum: 3, maximum: 15 }
    validates :name, presence: true, length: { minimum: 5, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    has_many :cricketer_courses
    has_many :cricketers, through: :cricketer_courses
end