class Job < ApplicationRecord
    belongs_to :user
    has_many :submittings
    has_many :jobfavourit
    #has_many :users, through: :submittings
end