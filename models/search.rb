class Search < ActiveRecord::Base
  def self.index_into_search(quote)
    sanitized_quote = quote.quote.delete("'")

    conn = ActiveRecord::Base.connection.raw_connection

    sql = "insert into searches (search_vectors, quote_id) values (to_tsvector('english', $1), $2);"
    conn.prepare('insert_into_index', sql)
    conn.exec_prepared('insert_into_index', [{ value: sanitized_quote }, { value: quote.id }])
    conn.exec('DEALLOCATE insert_into_index')

    ActiveRecord::Base.connection.close
  end

  def self.update_index(quote)
    conn = ActiveRecord::Base.connection.raw_connection

    sql = "update searches set search_vectors=to_tsvector('english', $1) where quote_id=$2;"
    conn.prepare('update_index', sql)
    conn.exec_prepared('update_index', [{ value: quote.quote }, { value: quote.id }])
    conn.exec('DEALLOCATE update_index')

    ActiveRecord::Base.connection.close
  end

  def self.search(words)
    params = words.split(' ').join('|')
    where("search_vectors @@ to_tsquery('english', ?)", params)
  end
end
