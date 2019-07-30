require 'rails_helper'

describe Review, type: :model do
	it 'creates a review' do
		review = Review.create(restaurant: 'Baan Thai', rating: 4.5, review:'Best thai place in the District')
		expect(review.restaurant).to eq('Baan Thai')
	end
end