class Article < ActiveRecord::Base
  @@asset_type = 'article'
  belongs_to :asset
  belongs_to :user

  def tags    
    self.asset.tags unless self.asset.nil?
  end

  def self.create_safely(name, content, mail_id, tags)
    asset    = Asset.create_safely(@@asset_type, mail_id, tags)
    @article = Article.new(:title     => name,
                           :content   => content, 
                           :asset_id  => asset.id, 
                           :user_id   => asset.mail_id,
                           :version   => 1);
    @article.save
    return @article
  end

end
