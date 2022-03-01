# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string(20)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Blog < ApplicationRecord
  include CommonModule
end
