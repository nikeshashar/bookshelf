class AddLanguageToBook < ActiveRecord::Migration
  def change
    add_column :books, :language, :text
  end
end
