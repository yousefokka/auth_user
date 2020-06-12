class Job < ApplicationRecord
    belongs_to :user
    has_many :submittings
    #has_many :users, through: :submittings
end