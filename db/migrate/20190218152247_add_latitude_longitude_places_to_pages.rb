class AddLatitudeLongitudePlacesToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :latitude, :string
    add_column :pages, :longitude, :string
    add_column :pages, :places, :string
  end
end
