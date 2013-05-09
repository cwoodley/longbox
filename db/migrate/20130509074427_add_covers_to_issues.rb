class AddCoversToIssues < ActiveRecord::Migration
  def self.up
    add_attachment :issues, :cover
  end

  def self.down
    remove_attachment :issues, :cover
  end

end
