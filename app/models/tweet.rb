class Tweet < ApplicationRecord

  # Validations
  validates :body, presence: true, length: { maximum: 140,
                                             too_long: "%<count>s is the maximum allowed" }

  # Associations
  belongs_to :user
  belongs_to :replied_to, class_name: "Tweet", optional: true, counter_cache: :replies_count
  has_many :replies, class_name: "Tweet",
                     foreign_key: "replied_to_id",
                     dependent: :destroy,
                     inverse_of: "replied_to"

  has_many :likes, dependent: :destroy

  validate :validate_replied

  private

  def validate_replied
    return unless replied_to_id

    return if Tweet.find_by(id: replied_to_id)

    errors.add(:replied_to_id, "Should be a valid replied_id")
  end
end
