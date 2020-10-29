require 'rails_helper'
describe 'リザベーションモデル機能', type: :model do
  let!(:client) { FactoryBot.create(:client_user) }
  let!(:event) { FactoryBot.create(:event,user: client) }
  describe 'バリデーションのテスト' do
    context 'リザベーションのチケット枚数が空の場合' do
      it 'バリデーションにひっかる' do
        reservation = Reservation.new(number_of_ticket: '', 
                          date: DateTime.now,
                          user:client,
                          event:event
                          )
        expect(reservation).not_to be_valid
      end
    end
    context 'リザベーションの公演時間が空の場合' do
      it 'バリデーションにひっかる' do
        reservation = Reservation.new(number_of_ticket: '1', 
                          date: '',
                          user:client,
                          event:event
                          )
        expect(reservation).not_to be_valid
      end
    end
    context '公演時間ちチケ枚数が記載されている場合' do
      it 'バリデーションが通る' do
        reservation = Reservation.new(number_of_ticket: '1', 
                          date: DateTime.now,
                          user:client,
                          event:event
                          )
        expect(reservation).to be_valid
      end
    end
  end
end