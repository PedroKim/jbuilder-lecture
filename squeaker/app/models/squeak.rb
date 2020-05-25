# == Schema Information
#
# Table name: squeaks
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Squeak < ApplicationRecord
  validates :body, presence: true

  belongs_to :author, #you can write user but this is semantic choice
    foreign_key: :author_id, #same as the foreign key on schema 
    primary_key: :id,
    class_name: :User

  has_many :likes,
    primary_key: :id,
    foreign_key: :squeak_id,
    class_name: :Like

  has_many :likers,
    through: :likes, # always call association in same class
    source: :user # 

  
end
