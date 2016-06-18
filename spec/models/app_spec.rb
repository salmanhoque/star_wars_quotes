require 'spec_helper'
require 'pry'

describe 'App' do
  after(:each) do
    Quote.delete_all
    Search.delete_all
  end

  context 'create and update quote' do
    before(:each) do
      Quote.create(quote: 'When 900 years old, you reach… Look as good, you will not.')
    end

    it 'adds new quotes to searches for full text searching' do
      expect(Quote.all.count).to eq(1)
      expect(Search.all.count).to eq(1)
    end

    it 'updates quotes and searches' do
      last_quote = Quote.last
      last_quote.update(quote: 'You don’t know how hard I found it, signing the order to terminate your life')
      expect(Quote.all.count).to eq(1)
      expect(Search.all.count).to eq(1)
      expect(Search.last.quote_id).to eq(last_quote.id)
    end
  end

  context 'searches and returns returns result' do
    it '' do
      first_quote = Quote.create(quote: 'When 900 years old, you reach… Look as good, you will not.')
      second_quote = Quote.create(quote: 'You don’t know how hard I found it, signing the order to terminate your life')

      expect(Quote.all.count).to eq(2)
      expect(Search.all.count).to eq(2)

      results = Search.search('looks good')
      expect(results.first.quote_id).to eq(first_quote.id)

      results = Search.search('terminate you')
      expect(results.first.quote_id).to eq(second_quote.id)
    end
  end
end
