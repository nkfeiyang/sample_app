require 'spec_helper'

describe "Layout links" do
  
  it "should have a Home page at '/'" do
    get '/'
    response.should render_template('pages/home')
  end


end
