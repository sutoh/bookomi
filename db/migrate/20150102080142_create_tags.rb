class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
