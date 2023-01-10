class Post < ApplicationRecord
  has_many :post_tags
  # post_tagsを通して複数のtagsを持っている
  has_many :tags, through: :post_tags
  # 親モデルの更新時、子モデルもまとめて更新されるようになる
  accepts_nested_attributes_for :post_tags
end
