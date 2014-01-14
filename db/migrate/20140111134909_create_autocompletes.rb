class CreateAutocompletes < ActiveRecord::Migration
  def change
    create_table :autocompletes do |t|
      t.string :term
      t.string :path

      t.timestamps
    end
  end
end
