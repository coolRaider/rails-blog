# == Schema Information
#
# Table name: articles
#
#  id                  :integer          not null, primary key
#  title               :string
#  text                :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  slug                :string
#  banner_file_name    :string
#  banner_content_type :string
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#

class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  acts_as_taggable_on :tags
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
