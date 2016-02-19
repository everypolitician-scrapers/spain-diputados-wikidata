#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = {
  10 => WikiData::Category.new('Categoría:Diputados_de_la_X_Legislatura_de_España', 'es').member_titles,
  11 => WikiData::Category.new('Categoría:Diputados_de_la_XI_Legislatura_de_España', 'es').member_titles,
}

ids = EveryPolitician::Wikidata.wdq('claim[463:21857364]')
binding.pry

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { es: names.values.flatten.uniq }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder
