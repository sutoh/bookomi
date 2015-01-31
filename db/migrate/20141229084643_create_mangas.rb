class CreateMangas < ActiveRecord::Migration
  def change
    create_table :mangas, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
      t.timestamps null: false
    end
  end
end
