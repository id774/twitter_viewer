# -*- coding: utf-8 -*-

require File.dirname(__FILE__) + '/../spec_helper'

describe StatusesController, 'ブログ' do
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
  end
end
