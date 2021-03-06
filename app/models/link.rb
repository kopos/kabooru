class Link < ActiveRecord::Base
  belongs_to :asset
  belongs_to :user
  validates_uniqueness_of :url

  @@asset_type = 'link'

  def tags
    self.asset.tags unless self.asset.nil?
  end

  def self.create_safely(name, content, mail_id, tags)
    asset = Asset.create_safely(@@asset_type, mail_id, tags)
    @link = Link.new(:title     => name,
                     :url       => content, 
                     :short_desc => name,
                     :asset_id  => asset.id, 
                     :user_id   => asset.mail_id);
    @link.save
    return @link
  end

end
