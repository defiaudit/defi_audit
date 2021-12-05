class CreateAuditModels < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'uuid-ossp'

    drop_table :projects

    create_table :auditors, id: :uuid, default: -> { "uuid_generate_v4()" }  do |t|
      t.string :name, null: false
      t.string :website, null: false
      t.timestamps
    end

    create_table :projects, id: :uuid, default: -> { "uuid_generate_v4()" }  do |t|
      t.string :name, null: false
      t.string :ticker
      t.string :website
      t.string :discord
      t.string :twitter
      t.string :chain
      t.string :icon_url
      t.timestamps
    end

    create_table :audits, id: :uuid, default: -> { "uuid_generate_v4()" } do |t|
      t.references :auditor, index: true, unique: true, null: false, foreign_key: true, type: :uuid
      t.references :project, index: true, unique: true, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.string :url, null: false
      t.date :date, null: false
      t.string :contract
      t.string :type
      t.timestamps
    end

    add_index :projects, :ticker, unique: true
    add_index :projects, :name, unique: true
  end
end