# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shop_id    :integer
#  user_id    :integer
#
class Bookmark < ApplicationRecord
belongs_to(:shop)
belongs_to(:user)
end
