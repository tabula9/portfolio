orders = [ ['新着更新順', 'new'], ['ブックマーク数の多い順', 'favnovelcnt'], ['レビュー数の多い順', 'reviewcnt'],
           ['総合ポイントの高い順', 'hyoka'], ['日間ポイントの高い順', 'dailypoint'], ['週間ポイントの高い順', 'weeklypoint'],
           ['月間ポイントの高い順', 'monthlypoint'], ['四半期ポイントの高い順', 'quarterpoint'], ['年間ポイントの高い順', 'yearlypoint'],
           ['感想の多い順', 'impressioncnt'], ['評価者数の多い順', 'hyokacnt'], ['週間ユニークユーザの多い順', 'weekly'],
           ['新着投稿順', 'ncodedesc']]
orders.each.with_index(1) do |(japanese, english), i|
  Order.seed(:id, {id: i, name: japanese, parameters: english})
end
