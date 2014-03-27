class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :github_url
      t.text :description
      t.string :thumbnail_url

      t.timestamps
    end
  end
end
