class AddsImgToSpecials < ActiveRecord::Migration[5.2]
  def change
    add_column :specials, :img, :string
  end
end
