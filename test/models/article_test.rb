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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
