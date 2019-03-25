require 'rails_helper'

describe 'ルーティング' do
  example '職員トップページ' do
    expect(get: 'http://wonder-gate.com/staff').to route_to(
      host: 'wonder-gate.com/staff',
      controller: 'staff/top',
      action: 'index'
    )
  end

  example '管理者ログインフォーム' do
    expect(get: 'http://chibi.example.com/admin/login').to route_to(
      host: 'chibi.example.com/admin',
      controller: 'admin/sessions',
      action: 'new'
    )
  end

  example '顧客トップページ' do
    expect(get: 'http://example.com/mypage').to route_to(
      host: 'example.com',
      controller: 'customer/top',
      action: 'index'
    )
  end
  
  example 'ホスト名が対象外ならerrors/not_foundへ' do
    expect(get: 'http://foo.example.jp').to route_to(
      controller: 'errors',
      action: 'routing_error'
    )
  end

  example '存在しないパスならerrors/not_foundへ' do
    expect(get: 'http://chibi.example.com/xyz').to route_to(
      controller: 'errors',
      action: 'routing_error',
      anything: 'xyz'
    )
  end
end
