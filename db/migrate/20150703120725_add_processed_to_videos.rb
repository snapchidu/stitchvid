class AddProcessedToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :processed, :boolean, :default => false
  end
end
