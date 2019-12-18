class AddOngoingToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :ongoing, :boolean, default: true
    add_index :projects, :ongoing
  end
end
