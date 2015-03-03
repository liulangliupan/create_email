class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.string :cline
      t.integer :story_id
      t.string :story_url
      t.date :launch_date
      t.text :body
      t.text :template_body

      t.timestamps null: false
    end
  end
end
