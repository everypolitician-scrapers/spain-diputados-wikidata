#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = {
  10 => WikiData::Category.new('Categoría:Diputados_de_la_X_Legislatura_de_España', 'es').member_titles,
  11 => WikiData::Category.new('Categoría:Diputados_de_la_XI_Legislatura_de_España', 'es').member_titles,
}

sparq = <<EOQ
  SELECT ?item
  WHERE {
      VALUES ?term { wd:Q2498034 wd:Q21857364 }
      ?item p:P39 ?position_statement .
      ?position_statement ps:P39 wd:Q18171345 ;
                          pq:P2937 ?term .
  }
EOQ

ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { es: names.values.inject(&:|) })
