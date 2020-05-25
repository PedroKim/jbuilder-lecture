# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  squeak_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :user, # like.user 
    primary_key: :id,
    foreign_key: :user_id, 
    class_name: :User 

  belongs_to :squeak,
    primary_key: :id,
    foreign_key: :squeak_id,
    class_name: :Squeak
end
