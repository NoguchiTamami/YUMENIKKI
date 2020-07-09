class Post < ApplicationRecord
   # Validation
    validates :title, presence: true
    validates :body, presence: true
    validates :body, length: { maximum: 200 }

    #関連付け
	belongs_to :user

	#タグ付機能
	acts_as_taggable

	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
