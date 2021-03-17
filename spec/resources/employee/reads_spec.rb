require 'rails_helper'

RSpec.describe EmployeeResource, type: :resource do
  describe 'serialization' do
    let!(:employee) { create(:employee) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(employee.id)
      expect(data.jsonapi_type).to eq('employees')
    end
  end

  describe 'filtering' do
    let!(:employee1) { create(:employee) }
    let!(:employee2) { create(:employee) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: employee2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([employee2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:employee1) { create(:employee) }
      let!(:employee2) { create(:employee) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            employee1.id,
            employee2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            employee2.id,
            employee1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
