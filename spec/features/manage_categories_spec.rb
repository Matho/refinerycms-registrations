require "spec_helper"

describe "manage categories items", :type => :feature do
  refinery_login_with_devise :authentication_devise_refinery_superuser

  context "when no categories items" do
    it "invites to create one" do
      visit refinery.race_registrations_admin_categories_path
      expect(page).to have_content("There are no Categories yet. Click \"Add New Category\" to add your first category")
    end

    describe "submenu links" do
      it "should have submenu links" do
        visit refinery.race_registrations_admin_categories_path

        within "#actions" do
          expect(page).to have_content("Manage")
        end
      end
    end

    describe "new/create" do
      it "allows to create category" do
        visit refinery.new_race_registrations_admin_category_path

        fill_in "Title", :with => "First category"
        click_button "Save"

        expect(page).to have_content("'First category' was successfully added.")

        expect(Refinery::RaceRegistrations::Category.count).to eq(1)
      end
    end

    describe "edit/update" do
      before { FactoryGirl.create(:category, :title => "Update me") }

      it "updates category" do
        visit refinery.race_registrations_admin_categories_path

        expect(page).to have_content("Update me")


        click_link "Edit this category"

        #save_and_open_page

        fill_in "Title", :with => "Updated"
        click_button "Save"

        expect(page).to have_content("'Updated' was successfully updated.")
      end
    end

    describe "destroy" do
      before { FactoryGirl.create(:category, :title => "Delete me") }

      it "removes category" do
        visit refinery.race_registrations_admin_categories_path

        click_link "Remove this category forever"

        expect(page).to have_content("'Delete me' was successfully removed.")

        expect(Refinery::RaceRegistrations::Category.count).to eq(0)
      end
    end

  end
end
