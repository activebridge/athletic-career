class CreateSMLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :sm_links do |t|
      t.references  :sm_linkable, polymorphic: true
      t.string      :type
      t.string      :facebook
      t.string      :vkontakte
      t.string      :google
      t.string      :twitter
      t.string      :instagram

      t.timestamps
    end
    add_index :sm_links, [:sm_linkable_id, :sm_linkable_type]
  end
end
