class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  #right now it's empty
  # ActiveRecord contains all cool stuffs for ORM
  #ApplicationRecord is a middle ground between our models and ActiveRecord
  
end
