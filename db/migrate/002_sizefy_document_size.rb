class SizefyDocumentSize < ActiveRecord::Migration
  def self.up
    change_column :documents, :content, :binary, :limit => 2.megabytes
  end

  def self.down
  end
end
