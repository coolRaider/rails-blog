# == Schema Information
#
# Table name: articles
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  text                :text(65535)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  slug                :string(255)
#  banner_file_name    :string(255)
#  banner_content_type :string(255)
#  banner_file_size    :integer
#  banner_updated_at   :datetime
#

class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  acts_as_taggable_on :tags
  has_attached_file :banner, url: "/system/:style/:hash.:extension", hash_secret: "jadfkladfs164372",
    :styles => { :big => ["600x200>", :png], :thumb => ["64x64>", :png] },
    :default_url => "/system/:style/missing.png"
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
  validates_attachment :banner, :content_type => {:content_type => /\Aimage/},
    :file_name => {:matches => [/png\Z/, /jpe?g\Z/]},
    :size => {:in => 0..2.megabytes}
end
