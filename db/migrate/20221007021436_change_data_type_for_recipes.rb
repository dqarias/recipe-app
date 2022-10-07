require "active_support/all"

class ChangeDataTypeForRecipes < ActiveRecord::Migration[7.0]
  def self.up
    change_table :recipes do |t|
      t.change :preparation_time::time without time zone, :time
      t.change :cooking_time, :time
    end
  end
  def self.down
    change_table :foods do |t|
      t.change :preparation_time, :string
      t.change :cooking_time, :string
    end
  end
end
# USING preparation_time::time without time zone