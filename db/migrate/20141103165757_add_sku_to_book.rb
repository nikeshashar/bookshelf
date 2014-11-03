class AddSkuToBook < ActiveRecord::Migration
  def change
    add_column :books, :sku, :text
  end
end
