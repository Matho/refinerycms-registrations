require "spec_helper"

describe "manage people items", :type => :feature do
  refinery_login_with_devise :authentication_devise_refinery_superuser

  context "when no people items" do
    it "invites to create one" do
      visit refinery.race_registrations_admin_people_path
      expect(page).to have_content("Sorry, no results found")
    end

    describe "submenu links" do
      it "should have submenu links" do
        visit refinery.race_registrations_admin_people_path

        within "#actions" do
          expect(page).to have_content("Manage")
        end
      end
    end

    describe "new/create" do
      before {
        FactoryGirl.create(:registration, :title => "#6 MSDC 2014")
        FactoryGirl.create(:category, :title => "Super Masters ( 1974 - 1915 )")
      }

      it "allows to create person" do
        visit refinery.new_race_registrations_admin_person_path

        fill_in "Name", :with => "Janko"
        fill_in "Surname", :with => "Hraško"
        select "#6 MSDC 2014", from: 'Registration ID'
        select "Super Masters ( 1974 - 1915 )", from: 'Category ID'
        fill_in "Country", :with => "Slovakia"
        select "1991", from: 'person_birth_date_1i'
        select "April", from: 'person_birth_date_2i'
        select "2", from: 'person_birth_date_3i'
        fill_in "Email", :with => "martin.markech@matho.sk"
        fill_in "Club", :with => "Club"
        fill_in "City", :with => "Bratislava"
        fill_in "Notice", :with => "note"


        click_button "Save"

        expect(page).to have_content("Hraško was successfully added.")

        expect(Refinery::RaceRegistrations::Person.count).to eq(1)
      end
    end

    describe "edit/update" do
      before { FactoryGirl.create(:person, :surname => "Update me", bypass_humanizer: true) }

      it "updates person" do
        visit refinery.race_registrations_admin_people_path

        expect(page).to have_content("Update me")


        click_link "Edit this person"

        #save_and_open_page

        fill_in "Surname", :with => "Updated"
        click_button "Save"

        expect(page).to have_content("'Updated' was successfully updated.")
      end
    end

    describe "destroy" do
      before { FactoryGirl.create(:person, :surname => "Delete me", bypass_humanizer: true) }

      it "removes person" do
        visit refinery.race_registrations_admin_people_path

        click_link "Remove this person forever"

        expect(page).to have_content("'Delete me' was successfully removed.")

        expect(Refinery::RaceRegistrations::Person.count).to eq(0)
      end
    end

  end
end
