#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = {
  10 => WikiData::Category.new('Categoría:Diputados_de_la_X_Legislatura_de_España', 'es').member_titles,
  11 => WikiData::Category.new('Categoría:Diputados_de_la_XI_Legislatura_de_España', 'es').member_titles,
}

sparq = 'SELECT ?item WHERE { ?item wdt:P463 wd:Q%s . }'
ids = {
  10 => EveryPolitician::Wikidata.sparql(sparq % 2498034),
  11 => EveryPolitician::Wikidata.sparql(sparq % 21857364),
}

EveryPolitician::Wikidata.scrape_wikidata(ids: ids.values.inject(&:|), names: { es: names.values.inject(&:|) })
