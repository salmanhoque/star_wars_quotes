class Search < ActiveRecord::Base
  def self.index_into_search(quote)
    sanitize = quote.quote.delete("'")
    sql = "insert into searches (search_vectors, quote_id) values (to_tsvector('english','#{sanitize}'), #{quote.id});"
    ActiveRecord::Base.connection.execute(sql)
  end

  def self.update_index(quote)
    sql = "update searches set search_vectors=to_tsvector('english', '#{quote.quote}') where quote_id=#{quote.id};"
    ActiveRecord::Base.connection.execute(sql)
  end

  def self.search(words)
    params = words.split(' ').join('|')
    where("search_vectors @@ to_tsquery('english', ?)", params)
  end
end
