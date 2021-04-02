class Question < ApplicationRecord
    acts_as_paranoid
    
    belongs_to :user
    has_many :answers


    
    has_many :feedbacks, dependent: :destroy
    accepts_nested_attributes_for :feedbacks, reject_if: :all_blank, allow_destroy: true
end
