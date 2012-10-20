# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "RaceRegistrations" do
    describe "Admin" do
      describe "registrations" do
        login_refinery_user

        describe "registrations list" do
          before do
            FactoryGirl.create(:registration, :title => "UniqueTitleOne")
            FactoryGirl.create(:registration, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.race_registrations_admin_registrations_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.race_registrations_admin_registrations_path

            click_link "Add New Registration"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::RaceRegistrations::Registration.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::RaceRegistrations::Registration.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:registration, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.race_registrations_admin_registrations_path

              click_link "Add New Registration"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::RaceRegistrations::Registration.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:registration, :title => "A title") }

          it "should succeed" do
            visit refinery.race_registrations_admin_registrations_path

            within ".actions" do
              click_link "Edit this registration"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:registration, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.race_registrations_admin_registrations_path

            click_link "Remove this registration forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::RaceRegistrations::Registration.count.should == 0
          end
        end

      end
    end
  end
end
