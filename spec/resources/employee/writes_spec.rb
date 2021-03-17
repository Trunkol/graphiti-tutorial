require 'rails_helper'

RSpec.describe EmployeeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'employees',
          attributes: attributes_for(:employee)
        }
      }
    end

    let(:instance) do
      EmployeeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Employee.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:employee) { create(:employee) }

    let(:payload) do
      {
        data: {
          id: employee.id.to_s,
          type: 'employees',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EmployeeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { employee.reload.updated_at }
      # .and change { employee.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:employee) { create(:employee) }

    let(:instance) do
      EmployeeResource.find(id: employee.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Employee.count }.by(-1)
    end
  end
end
