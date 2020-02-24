# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  caption    :text
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Photo < ApplicationRecord
  validates(:image, {:presence => true})
  has_many :likes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  belongs_to :author, :class_name => "User", :foreign_key => "owner_id" 

  has_many :fans, :through => :likes, :source => :fan
  has_many :commenters, :through => :comments, :source => :author 
end
