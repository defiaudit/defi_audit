class RemoveAuditNameField < ActiveRecord::Migration[6.1]
  def change
    remove_column :audits, :name
  end
end
