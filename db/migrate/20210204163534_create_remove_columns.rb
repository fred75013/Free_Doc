class CreateRemoveColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :remove_columns do |t|
      remove_column :doctors, :specialty
      t.timestamps
    end
  end
end
