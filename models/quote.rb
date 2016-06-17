class Quote < ActiveRecord::Base
  after_create ->{ Search.index_into_search(self) }
  after_update ->{ Search.update_index(self) }
end
