class AddShowToActiveStorageAttachments < ActiveRecord::Migration[5.2]
  def change
  	add_column :active_storage_attachments, :show, :boolean, default: :true
  end
end
