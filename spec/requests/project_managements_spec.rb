require 'spec_helper'

describe "Project Management" do

  subject { page }

  describe "creation" do
    def good_input
      visit new_project_path
      fill_in "Name",           :with => "some stuff"
      fill_in "Github url",     :with => "some stuff"
      fill_in "Thumbnail url",  :with => "some stuff"
      click_button "create project"
    end

    describe "authorized user trying to create" do
      let(:admin) { FactoryGirl.create(:admin) }

      before do 
        sign_in admin 
        visit new_project_path
      end

      describe "bad info" do
        it "should not make a new project" do
          click_button "create project"

          expect(page.title).to eq('New Project')
          expect(page).to have_selector('.incomplete')
        end
      end

      describe "good info" do
        it "should make a new project" do
          good_input

          expect(page.title).to eq('Admin Panel')
        end
      end
    end

    describe "unauthorized user trying to create" do
      it "should redirect to root and flash hacker message" do
        visit new_project_path
        good_input

        expect(page.title).to eq('10 apps, 9ish weeks')
        expect(page).to have_selector('.hacker')
      end
    end
  end
end
