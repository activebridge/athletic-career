class RenameVkInSmLinks < ActiveRecord::Migration[5.0]
  def change
    rename_column :sm_links, :vkontakte, :vk
  end
end
