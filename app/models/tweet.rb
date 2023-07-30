class Tweet < ApplicationRecord
   
  # Associations
  belongs_to :user
  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count
  has_many :replies, class_name: "Tweet",
                      foreign_key: "replied_to_id",
                      dependent: :destroy,
                      inverse_of: "replied_to"
 
  has_many :likes, dependent: :destroy
  validate :validate_replied

end
