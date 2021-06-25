class Asset < ActiveRecord::Base
  has_many :articles
  has_many :documents
  has_many :links
  has_and_belongs_to_many :tags
  belongs_to :user

  def self.create_safely(type, mail_id, tags)
    u  = User.find_by_email mail_id
    ty = Type.find_by_name type

    if u.nil? or ty.nil? then
      puts "Invalid user or type"
    else
      @asset = Asset.new :mail_id => u.id, :type_id => ty.id
    end

    tags.each do |tag|
      t = Tag.find_or_create_by_name(tag)
      @asset.tags << t if @asset.save
    end

    return @asset
  end
  
  def texttags
    tags.collect  {|tag|  tag.name  }
  end
end
