class Document < ActiveRecord::Base
  @@asset_type = 'document'
  belongs_to :asset
  belongs_to :user

  def tags
    self.asset.tags unless self.asset.nil?
  end

  def self.create_safely(name, content, mail_id, tags)
    asset     = Asset.create_safely(@@asset_type, mail_id, tags)
    @document = Document.new(:title     => name,
                             :file_name => name,
                             :content   => content, 
                             :asset_id  => asset.id, 
                             :user_id   => asset.mail_id,
                             :version   => 1,
                             :mime      => '' #content_type
                            );
    @document.save
    return @document
  end

  def content_type
    unless self.file_name.nil?    
      extension = self.file_name[-3..-1] #the last three characters
    else
      extension = self.title[-3..-1] #the last three characters
    end

    return FILE_EXTENSION_MIME_TYPES[extension] || 'application/octet-stream'
  end
  
  def icon
    unless self.file_name.nil?    
      extension = self.file_name[-3..-1] #the last three characters
    else
      extension = self.title[-3..-1] #the last three characters
    end
    
    return FILE_EXTENSION_ICONS[extension] || 'page.png'
  end
  
  FILE_EXTENSION_MIME_TYPES  = {
    'doc'  => 'application/word',
    'html' => 'text/html',
    'htm'  => 'text/html',
    'ppt'  => 'application/vnd.ms-powerpoint',
    'pdf'  => 'application/pdf',
    'txt'  => 'text/plain'
  }
  
  FILE_EXTENSION_ICONS =  {
    'doc' => 'page_word.png',
    'pdf' => 'page_acrobat.png',
    'ppt' => 'page_powerpoint.png',
    'xls' => 'page_excel.png'
  }
end
