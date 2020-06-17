class Submitting < ApplicationRecord
    belongs_to :user
    belongs_to :job 

    has_one :jobresponce
end
