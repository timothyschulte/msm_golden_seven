class Actor < ApplicationRecord
    validates(:name, { :uniqueness => true, :presence => true })
end
