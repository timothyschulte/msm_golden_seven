class Director < ApplicationRecord
     validates(:name, { :uniqueness => true, :presence => true })
    
end
