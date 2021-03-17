require 'rails_helper'

RSpec.describe "employees#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/employees/#{employee.id}", payload
  end

  describe 'basic update' do
    let!(:employee) { create(:employee) }

    let(:payload) do
      {
        data: {
          id: employee.id.to_s,
          type: 'employees',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(EmployeeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { employee.reload.attributes }
    end
  end
end
