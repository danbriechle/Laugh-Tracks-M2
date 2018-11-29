class AddsRuntimeToSpecials < ActiveRecord::Migration[5.2]
  def change
    add_column :specials, :runtime, :integer
  end
end
