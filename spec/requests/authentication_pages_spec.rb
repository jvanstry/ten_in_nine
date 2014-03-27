require 'spec_helper'

describe 'authentication' do

  subject { page }

  describe 'admin login' do
    before { visit login_path }

    it { should have_content('Admin Signin') }
    it { should have_title('Admin') }

    describe 'invalid credentials' do 
      before { click_button 'signin'}

      it { should have_title 'Admin'}
      it { should have_selector '.signin.error'}
    end

    describe 'valid credentials' do 
      let(:admin) { FactoryGirl.create(:admin) }

      before do
        FactoryGirl.create(:project)

        fill_in 'session_name',    with: admin.name
        fill_in 'session_password', with: admin.password
        click_button 'signin'
      end

      it { should have_title 'Admin Panel' }
      it { should have_link 'new project', href: new_project_path }
      it { should have_content 'delete project' }
    end
  end
end
