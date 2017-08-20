# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  name       :string
#  dob        :string
#  bio        :text
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Director < ApplicationRecord
    
#  - name: must be present; must be unique in combination with dob
    validates :name, :presence => true, :uniqueness => { :scope => :dob }
#  - dob: no rules
#  - bio: no rules
#  - image_url: no rules

has_many(:actors, :class_name => "Actor", :foreign_key => "movie_id")

has_many(:movies, :class_name => "Movie", :foreign_key => "director_id")

end
