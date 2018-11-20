class CreateShortenedLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_links do |t|
      t.string :short_url
      t.string :full_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
