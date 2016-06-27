class AddAttachmentBannerToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :articles, :banner
  end
end
