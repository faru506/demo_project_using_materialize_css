class AddPasswordDigestToCricketers < ActiveRecord::Migration[5.1]
  def change
    add_column :cricketers, :password_digest, :string
  end
end
