class AddRadioToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :radio, :string
  end
end
