#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = WikiData::Category.new('Categoría:Diputados_de_la_X_Legislatura_de_España', 'es').member_titles
EveryPolitician::Wikidata.scrape_wikidata(names: { es: names }, output: false)
warn EveryPolitician::Wikidata.notify_rebuilder
