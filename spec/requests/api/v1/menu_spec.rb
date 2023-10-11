require 'rails_helper'

RSpec.describe 'Api::V1::Menus', type: :request do
  describe 'GET /menus' do
    before do
      Menu.create(name: "menu1",price: "10")
      Menu.create(name: "menu2",price: "20")
      Menu.create(name: "test3",price: "30")
      Menu.create(name: "test4",price: "40")
    end

    context 'GET all menus' do

      it "Should be successful" do
        get '/api/v1/menus', params: { format: :json }
        expect(response).to be_successful
      end

      it "Should get all menu" do 
        get '/api/v1/menus', params: { format: :json }
        parsed_body = JSON.parse(response.body)
        expect(parsed_body["menus"]).to be_present
        expect(parsed_body["menus"].size).to eq(4)
      end
    end

    context "Search in Menu" do
      it "Should search by name" do
        get '/api/v1/menus', params: { format: :json, name: "menu" }
        parsed_body = JSON.parse(response.body)
        expect(parsed_body["menus"].size).to eq(2)
      end

      it "Should search by particular name" do
        get '/api/v1/menus', params: { format: :json, name: "menu1" }
        menu = JSON.parse(response.body)["menus"]
        expect(menu.size).to eq(1)
        expect(menu.first["name"]).to eq("menu1")
      end

      it "Should not found any record" do
        get '/api/v1/menus', params: { format: :json, name: "no record" }
        menu = JSON.parse(response.body)["menus"]
        expect(menu).to be_empty
      end

    end

    context "Sort by name and price" do 

      it "Sort on price by ascending" do 
        get '/api/v1/menus', params: { format: :json, sort_by: "asc" }
        menu = JSON.parse(response.body)["menus"]
        price_list=menu.map{|a| a["price"]}
        expect(price_list).to eq(price_list.sort)
      end

      it "Sort on price by desecnding" do 
        get '/api/v1/menus', params: { format: :json, sort_by: "desc" }
        menu = JSON.parse(response.body)["menus"]
        price_list=menu.map{|a| a["price"]}
        expect(price_list.reverse).to eq(price_list.sort.reverse)
      end
    end

    describe 'pagination' do
      
      context 'when invalid page is provided' do
        let(:invalid_page) { 100000 }
        it 'returns last page' do
          get '/api/v1/menus', params: { format: :json, page: invalid_page }
          binding.pry
          parsed_body = JSON.parse(response.body)
          expect(parsed_body["paginations"]["total_pages"]).not_to eq(invalid_page)
        end
      end

      context 'when valid page is provided' do
        let(:valid_page) { 1 }
        let(:items) { 1 }

        it 'returns last page' do
          get '/api/v1/menus', params: { format: :json, page: valid_page, items: items }
          parsed_body = JSON.parse(response.body)
          expect(parsed_body["paginations"]["total_pages"]).to eq(valid_page)
        end
      end
    end
  end
end

