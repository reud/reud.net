class AddContentNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :todos, :content, false
  end
end
