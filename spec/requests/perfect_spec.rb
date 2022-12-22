require 'rails_helper'

RSpec.describe "Perfects", type: :request do
  describe "GET /" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /output" do
    it "returns http success" do
      get calc_output_path, params: { array: "1 2 6 28 5 496 13" }
      expect(response).to have_http_status(:success)
    end

    context 'returns http code 302' do
      it "empty parameter" do
        get calc_output_path, params: {}
        expect(response).to have_http_status(302)
      end

      it "wrong input" do
        get calc_output_path, params: { array: 'qwerty' }
        expect(response).to have_http_status(302)
      end
    end

    context 'controller tests' do
      it 'test @arr' do
        get calc_output_path, params: { array: "1 2 6 28 5 496 13" }
        expect(assigns(:arr)).to eq([["6", "28"], ["496"]])
      end
    end

    context 'redirect to input' do
      it 'redirect with wrong input' do
        get calc_output_path, params: { array: 'qwerty' }
        expect(response).to redirect_to(root_path)
      end

      it 'redirect with empty input' do
        get calc_output_path, params: {}
        expect(response).to redirect_to(root_path)
      end
    end
    it "returns different values" do
      get "/calc/output", params: { array: "1 2 6 28 5 496 13"}
      first = :cuts
      get "/calc/output", params: { array: "1 2 6 28 5 496 12"}
      second = :cuts
      expect(assigns(first)).not_to be eq(second)
    end
  end

  
end
