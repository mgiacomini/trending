class CreateRepositories < ActiveRecord::Migration[5.1]
  def change
    create_table :repositories do |t|
      t.integer :github_id
      t.string :language
      t.integer :forks_count
      t.string :name
      t.text :description
      t.integer :watchers_count
      t.string :url

      t.timestamps
    end
  end
end
