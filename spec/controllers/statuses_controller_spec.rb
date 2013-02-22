# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe StatusesController do
  fixtures :all

  context 'にアクセスすると' do
    describe '一覧表示' do
      it "一覧画面が表示される" do
        get 'index'
        response.should be_success
      end
    end

    describe '編集画面' do
      it "編集画面が表示される" do
        get 'edit', :id => 1
        response.should be_success
      end
    end

    describe '検索' do
      context '絞り込み対象の uid を送信する' do
        it "結果が表示される" do
          post 'index', :param => {
            :uid => "1",
          }

          response.should be_success
          response.should_not be_redirect
          response.header.should have_at_least(1).items
          flash[:notice].should be_nil
        end
      end

      context '絞り込み対象の screen_name を送信する' do
        it "結果が表示される" do
          post 'index', :param => {
            :screen_name => "hoge",
          }

          response.should be_success
          response.should_not be_redirect
          response.header.should have_at_least(1).items
          flash[:notice].should be_nil
        end
      end
    end

  end
end
