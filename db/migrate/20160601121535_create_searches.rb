class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches, primary_key: 'id' do |t|
      t.column 'search_vectors', 'tsvector'
      t.integer :quote_id, null: true
    end
  end
end
