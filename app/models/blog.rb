# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  image      :text
#  title      :string(20)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Blog < ApplicationRecord
  include CommonModule
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true

end
