require 'rails_helper'
describe 'イベントモデル機能', type: :model do
  let!(:client) { FactoryBot.create(:client_user) }
  describe 'バリデーションのテスト' do
    context 'イベントのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        event = Event.new(event_name: '', 
                          company_name: '劇団上昇志向',
                          place: '帝国劇場',
                          period: DateTime.now,
                          period_end: DateTime.now,
                          status: '公演前'
                          )
        expect(event).not_to be_valid
      end
    end
    context 'イベントの団体名が空の場合' do
      it 'バリデーションにひっかかる' do
                event = Event.new(event_name: '勇気とジュリエット', 
                company_name: '',
                place: '帝国劇場',
                period: DateTime.now,
                period_end: DateTime.now,
                status: '公演前'
                )
        expect(event).not_to be_valid
      end
    end
    context 'イベントの場所が空の場合' do
      it 'バリデーションにひっかる' do
        event = Event.new(event_name: '勇気とジュリエット', 
                          company_name: '劇団上昇志向',
                          place: '',
                          period: DateTime.now,
                          period_end: DateTime.now,
                          status: '公演前'
                          )
        expect(event).not_to be_valid
      end
    end
    context 'イベントの期日が空の場合' do
      it 'バリデーションにひっかる' do
        event = Event.new(event_name: '勇気とジュリエット', 
                          company_name: '劇団上昇志向',
                          place: '帝国劇場',
                          period: "",
                          period_end: DateTime.now,
                          status: '公演前'
                          )
        expect(event).not_to be_valid
      end
    end
    context 'イベントの終日が空の場合' do
      it 'バリデーションにひっかる' do
        event = Event.new(event_name: '勇気とジュリエット', 
                          company_name: '劇団上昇志向',
                          place: '帝国劇場',
                          period: DateTime.now,
                          period_end: "",
                          status: '公演前'
                          )
        expect(event).not_to be_valid
      end
    end
    context 'イベントのステータスが空の場合' do
      it 'バリデーションにひっかる' do
        event = Event.new(event_name: '勇気とジュリエット', 
                          company_name: '劇団上昇志向',
                          place: '帝国劇場',
                          period: DateTime.now,
                          period_end: DateTime.now,
                          status: ''
                          )
        expect(event).not_to be_valid
      end
    end
    context '全て記載されているの場合' do
      it 'バリデーションが通る' do
        event = Event.new(event_name: '勇気とジュリエット', 
                          company_name: '劇団上昇志向',
                          place: '帝国劇場',
                          period: DateTime.now,
                          period_end: DateTime.now,
                          status: 0,
                          user:client
                          )
        expect(event).to be_valid
      end
    end
  end
end