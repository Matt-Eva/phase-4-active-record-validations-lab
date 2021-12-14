class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "is not included in the list"}
    validate :is_clickbait

    def is_clickbait
        t = title.to_s
        # if t.include? "True Facts"  
        #     errors.add(:title, "Title must be clickbait!")
        # end
        bait_array = ["Won't Believe", "Secret", "Top", "Guess"]
        unless bait_array.any? {|bait| t.include? bait}
            errors.add(:title, "Title must be clickbait!")
        end
    end

end
