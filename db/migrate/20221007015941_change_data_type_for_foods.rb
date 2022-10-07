class ChangeDataTypeForFoods < ActiveRecord::Migration[7.0]
  def self.up
    change_table :foods do |t|
      t.change :price, :float
    end
  end
  def self.down
    change_table :foods do |t|
      t.change :price, :integer
    end
  end
end
