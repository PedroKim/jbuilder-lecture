# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
  # all models inherit form ApplicationRecord which also inherits from ActiveRecord
  # you will get schema information from bundle exec annotate --models
   validates :name, presence: true #tell this column is required


  has_many :users,
    foreign_key: :location_id,
    primary_key: :id,
    class_name: :User

  has_many :squeaks,
    through: :users, #should be the name of association
    source: :squeaks #should be the name of association
    #colons are important!
end
