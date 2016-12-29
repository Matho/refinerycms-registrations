require "spec_helper"

describe "manage registrations items", :type => :feature do
  refinery_login_with_devise :authentication_devise_refinery_superuser

  context "when no registrations items" do
    it "invites to create one" do
      visit refinery.race_registrations_admin_registrations_path
      expect(page).to have_content("There are no Registrations yet. Click \"Add New Registration\" to add your first registration")
    end

    describe "submenu links" do
      it "should have submenu links" do
        visit refinery.race_registrations_admin_registrations_path

        within "#actions" do
          expect(page).to have_content("Manage")
        end
      end
    end

    describe "new/create" do
      before {
        FactoryGirl.create(:group, :title => "MSDC 2014")
        FactoryGirl.create(:group, :title => "MSDC 2015")
      }

      it "allows to create registration" do
        visit refinery.new_race_registrations_admin_registration_path

        fill_in "Title", :with => "First registration"
        select "MSDC 2014", from: 'Groups'

        click_button "Save"

        expect(page).to have_content("'First registration' was successfully added.")

        expect(Refinery::RaceRegistrations::Registration.count).to eq(1)
      end
    end

    describe "edit/update" do
      before { FactoryGirl.create(:registration, :title => "Update me") }

      it "updates registration" do
        visit refinery.race_registrations_admin_registrations_path

        expect(page).to have_content("Update me")


        click_link "Edit this registration"

        #save_and_open_page

        fill_in "Title", :with => "Updated"
        click_button "Save"

        expect(page).to have_content("'Updated' was successfully updated.")
      end
    end

    describe "destroy" do
      before { FactoryGirl.create(:registration, :title => "Delete me") }

      it "removes registration" do
        visit refinery.race_registrations_admin_registrations_path

        click_link "Remove this registration forever"

        expect(page).to have_content("'Delete me' was successfully removed.")

        expect(Refinery::RaceRegistrations::Registration.count).to eq(0)
      end
    end

  end
end
