class ChangeDataTypeForRecipeFoods < ActiveRecord::Migration[7.0]
  def self.up
    change_table :recipe_foods do |t|
      t.change :quantity, :integer
    end
  end
  def self.down
    change_table :recipe_foods do |t|
      t.change :quantity, :string
    end
  end
end
