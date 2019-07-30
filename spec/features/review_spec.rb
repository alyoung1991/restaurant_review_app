require 'rails_helper'

describe Review, type: :feature do
	it 'visits the index page' do
		visit '/'
		expect(page.text).to include 'Restaurants'
	end

	it 'creates a review' do
		visit '/'
		click_on 'New Review'
		expect(page.text).to include 'Write a Review'
		find('#review_restaurant').set('Mcdonalds')
		find('#review_rating').set(1.0)
		find('#review_review').set('Not much to live up to')
		click_on 'Submit Review'
		expect(page.text).to include 'Mcdonalds'
	end

	it 'edits a review' do
		visit '/'
		click_on 'New Review'
		expect(page.text).to include 'Write a Review'
		find('#review_restaurant').set('Mcdonalds')
		find('#review_rating').set(1.0)
		find('#review_review').set('Not much to live up to')
		click_on 'Submit Review'
		click_on 'Edit'
		find('#review_restaurant').set('Wendys')
		click_on 'Save Review'
		expect(page.text).to include 'Wendys'
	end

	it 'deletes a review' do
		visit '/'
		click_on 'New Review'
		expect(page.text).to include 'Write a Review'
		find('#review_restaurant').set('Mcdonalds')
		find('#review_rating').set(1.0)
		find('#review_review').set('Not much to live up to')
		click_on 'Submit Review'
		click_on 'Delete'
		expect(page.text).not_to include 'Mcdonalds'
	end
end