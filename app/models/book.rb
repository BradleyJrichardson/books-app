class Book < ApplicationRecord
  belongs_to :author
  has_many :reviews, :dependent => :delete_all
end
