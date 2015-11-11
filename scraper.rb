#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'

@pages = [ 'Categoría:Diputados_de_la_X_Legislatura_de_España' ]

@pages.map { |c| WikiData::Category.new(c, 'es').wikidata_ids }.flatten.uniq.each do |id|
  data = WikiData::Fetcher.new(id: id).data('es') or next
  ScraperWiki.save_sqlite([:id], data)
end
