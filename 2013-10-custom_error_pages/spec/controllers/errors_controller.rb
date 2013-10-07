require 'spec_helper'  # I'm using Shoulda matchers & RSpec

describe ErrorsController do

  before do
    # without login !
    described_class.any_instance.stub(:current_user).and_return(nil)
  end

  context '404 page' do
    before{ get :show, status: 404, format: 'html' }

    it{ should respond_with(:success)}
    it{ should render_template('errors/404')}
    it{ should render_template('layouts/error_page')}
    it{ assigns(:title).should  eq "Page not found" }
    it{ assigns(:status).should eq '404' }
  end

  context '500 page' do
    before{ get :show, status: 500 }

    it{ should respond_with(:success)}
    it{ should render_template('errors/500')}
    it{ should render_template('layouts/error_page')}
    it{ assigns(:title).should  eq "Page error" }
    it{ assigns(:status).should eq '500' }
  end

  context 'unknown status' do
    it{ expect{get :show, status: 123}.to raise_error } # => therefor 500 is rendered
  end
end
