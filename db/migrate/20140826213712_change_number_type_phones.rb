class ChangeNumberTypePhones < ActiveRecord::Migration
  def change
    remove_column :phones, :number
    add_column :phones, :number, :string
  end
end
