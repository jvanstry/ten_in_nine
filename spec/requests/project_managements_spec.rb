require 'spec_helper'

describe "Project Management" do
  describe "creation" do
    before(:each) do
      visit new_project_path
    end

    def good_input
      visit new_project_path
      fill_in "name",           :with => "some stuff"
      fill_in "github_url",     :with => "some stuff"
      fill_in "thumbnail_url",  :with => "some stuff"
      click_button
    end

    describe "authorized user trying to create" do
      let(:admin) { FactoryGirl.create(:admin) }

      before(:each) do
        current_user = admin
      end

      describe "bad info" do
        it "should not make a new project" do
          lambda do
            fill_in "name",            :with => ""
            fill_in "github_url",      :with => ""
            fill_in "description",     :with => ""
            click_button

            Project.should_receive(:save).and_return(false)
            response.should render_template('projects/new')
            response.should have_selector('.incomplete')
          end
        end
      end

      describe "good info" do
        it "should make a new project" do
          lambda do
            good_input

            Project.should_receive(:save).and_return(true)
            response.should render_template('project/show')
          end
        end
      end
    end

    describe "unauthorized user trying to create" do
      it "should redirect to root and flash hacker message" do
          lambda do
            good_input

            Project.should_receive(:save).and_return(false)
            response.should render_template('root')
            response.should have_selector('.hacker')
          end
        end
    end
  end
end
