class Post < ApplicationRecord
    # valiadate user presence
    validates :title, presence: true  
    # ensures content's minimum length  250 
    validates :content, length: { minimum: 250 }
    # ensures summary's maximum length  250 
    validates :summary, length: { maximum: 250 }
    # "Inclusion" validates that the attributes' values are included in a given se
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbait?
  
    CLICKBAIT_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top \d/i,
      /Guess/i
    ]
  
    def clickbait?
      if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbait")
      end
    end
  end