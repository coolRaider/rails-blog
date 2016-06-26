# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#

class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  acts_as_taggable_on :tags
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
