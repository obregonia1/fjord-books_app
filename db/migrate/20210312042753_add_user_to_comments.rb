# frozen_string_literal: true

class AddUserToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, null: false, default: '', foreign_key: true
  end
end
