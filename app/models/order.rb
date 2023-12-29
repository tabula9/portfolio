class Order < ApplicationRecord
  has_many :favorites, primary_key: 'parameters', foreign_key: 'order_parameters' 
end
