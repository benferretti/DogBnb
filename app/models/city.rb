class City < ApplicationRecord
    has_many :dogs, through: :strolls
    has_many :dogsitters, through: :strolls
end
