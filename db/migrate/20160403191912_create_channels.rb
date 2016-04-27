class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
