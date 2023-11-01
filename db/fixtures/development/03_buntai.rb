buntais = [ ['字下げされておらず、連続改行が多い作品', '1'], ['字下げされていないが、改行数は平均な作品', '2'],
            ['字下げが適切だが、連続改行が多い作品', '4'], ['字下げが適切でかつ改行数も平均な作品', '6'] ]
buntais.each.with_index(1) do |(buntai, number), i|
  Buntai.seed(:id, {id: i, name: buntai, parameters: number})
end
