require 'rails_helper'

RSpec.describe KittensController, type: :controller do
  let(:kittens) { create_list(:kitten, 20) }
  let(:kitten) { create(:kitten)}
  let(:kitten_id) { kitten.id }

  describe "GET #index" do
    before { get :index}
    it "returns all kittens" do
      expect(assigns(:kittens)).to eq(kittens)
    end
  end

  describe "GET #show" do
    before { get :show, params: {id: kitten_id}}
    it "returns the kitten" do
      expect(assigns(:kitten)).to eq(kitten)
    end
  end

  describe "GET #new" do
  end

  describe "GET #edit" do
  end

end
