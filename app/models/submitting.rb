class Submitting < ApplicationRecord
    belongs_to :user
    belongs_to :job 

    def Submitting?
        submitting.present?
      end 
end
