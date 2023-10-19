class CreateGuestListEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_list_entries do |t|
      t.string :name

      t.timestamps
    end
  end
end
