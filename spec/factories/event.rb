FactoryBot.define do
  factory :event do
    event_name { '勇気とジュリエット' }
    company_name { '劇団上昇志向' }
    place { '帝国劇場' }
    period { DateTime.now }
    period_end { DateTime.now }
    price  { '5000' }
    direction  { 'シェイクシェイク勇気' }
    status { '公演前' }
    remarks  { '特になし' }
  end
  factory :event2, class: Event do
    event_name { 'ロミオと豆枝晋' }
    company_name { '劇団中央みぎレフト' }
    place { '鳥取市民会館' }
    period { DateTime.now }
    period_end { DateTime.now }
    price  { '100' }
    direction  { '豆枝晋/タ魯迅' }
    status { '公演前' }
    remarks  { '特になし' }
  end
end
