# == Schema Information
#
# Table name: shops
#
#  id         :integer          not null, primary key
#  address    :string
#  latitude   :float
#  longitude  :float
#  name       :string
#  rating     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Shop < ApplicationRecord
end
