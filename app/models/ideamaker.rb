class Ideamaker < ApplicationRecord
    belongs_to :user, optional: true
    has_many :ideas
    has_many :jobs
    has_many :jobs, through: :submittings


end
