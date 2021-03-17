require 'rails_helper'

RSpec.describe "employees#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/employees", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:employee)
    end
    let(:payload) do
      {
        data: {
          type: 'employees',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(EmployeeResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Employee.count }.by(1)
    end
  end
end
