# frozen_string_literal: true

class ChangeDatatype < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reports, :title, false
    change_column_null :reports, :text, false
    change_column_null :reports, :user_id, false
    change_column_null :comments, :text, false
  end
end
