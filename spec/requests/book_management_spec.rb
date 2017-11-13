require "rails_helper"

RSpec.describe "Widget management", :type => :request do

  it 'should render Books path' do
    get "/books/new"
    expect(response).to render_template(:new)
  end

  it 'should not render wrong template' do
    get "/books/new"
    expect(response).to_not render_template(:show)
  end
end