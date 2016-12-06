class AddPriorityToBanners < ActiveRecord::Migration[5.0]
  def change
    add_column :banners, :priority, :integer, default: 0
  end
end
