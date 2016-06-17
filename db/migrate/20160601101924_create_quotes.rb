class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes, primary_key: 'id' do |t|
      t.string :quote
    end
  end
end
