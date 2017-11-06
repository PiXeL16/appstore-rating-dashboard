require 'spec_helper.rb'

describe 'Get Review Info' do
  before(:each) do
    @mock_review_respose = {"author"=>{"uri"=>{"label"=>"https://itunes.apple.com/us/reviews/id291846312"}, "name"=>{"label"=>"Tergeek"}, "label"=>""}, "im:version"=>{"label"=>"5.17.0"}, "im:rating"=>{"label"=>"1"}, "id"=>{"label"=>"1901621228"}, "title"=>{"label"=>"Trash"}, "content"=>{"label"=>"Hard to grow any sort of a following on the platform and even harder on the app.", "attributes"=>{"type"=>"text"}}, "link"=>{"attributes"=>{"rel"=>"related", "href"=>"https://itunes.apple.com/us/review?id=336353151&type=Purple%20Software"}}, "im:voteSum"=>{"label"=>"0"}, "im:contentType"=>{"attributes"=>{"term"=>"Application", "label"=>"Application"}}, "im:voteCount"=>{"label"=>"0"}}
    @review = Models::Review.new(@mock_review_respose)
  end

  it 'it initialize the review class succesfully' do
    expect(@review.author_name).to eq('Tergeek')
    expect(@review.rating).to eq(1)
    expect(@review.title).to eq('Trash')
    expect(@review.content).to eq('Hard to grow any sort of a following on the platform and even harder on the app.')
    expect(@review.version).to eq('5.17.0')
  end

  it 'exports to hash succesfully' do 
    expect(@review.to_hash[:author_name]).to eq('Tergeek')
    expect(@review.to_hash[:rating]).to eq(1)
    expect(@review.to_hash[:title]).to eq('Trash')
    expect(@review.to_hash[:content]).to eq('Hard to grow any sort of a following on the platform and even harder on the app.')
    expect(@review.to_hash[:version]).to eq('5.17.0')
  end
end
