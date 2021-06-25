class PruneTables < ActiveRecord::Migration
  def self.up
    remove_column :documents, :text
  end

  def self.down
    add_column :documents, :text, :text
  end
end
