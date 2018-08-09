class RenameAmountInClFromDoses < ActiveRecord::Migration[5.2]
  def change
    rename_column :doses, :amount_in_cl, :description
  end
end
