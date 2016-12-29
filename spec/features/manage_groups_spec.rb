require "spec_helper"

describe "manage grpups items", :type => :feature do
  refinery_login_with_devise :authentication_devise_refinery_superuser

  context "when no groups items" do
    it "invites to create one" do
      visit refinery.race_registrations_admin_groups_path
      expect(page).to have_content("There are no Groups yet. Click \"Add New Group\" to add your first group")
    end

    describe "submenu links" do
      it "should have submenu links" do
        visit refinery.race_registrations_admin_groups_path

        within "#actions" do
          expect(page).to have_content("Manage")
        end
      end
    end

    describe "new/create", js: true do
      before {
        FactoryGirl.create(:category, :title => "Super Masters ( 1974 - 1915 )")
        FactoryGirl.create(:category, :title => "Hobby Full ( 1995 - 1985 )")
      }

      it "allows to create group" do
        visit refinery.new_race_registrations_admin_group_path

        fill_in "Title", :with => "First group"

        select_from_chosen "#group_category_ids", "Super Masters"
        select_from_chosen "#group_category_ids", "Hobby Full"

        click_button "Save"

        expect(page).to have_content("'First group' was successfully added.")

        expect(Refinery::RaceRegistrations::Group.count).to eq(1)
        #expect(Refinery::RaceRegistrations::GroupCategory.count).to eq(2)
      end
    end

    describe "edit/update" do
      before { FactoryGirl.create(:group, :title => "Update me") }

      it "updates group" do
        visit refinery.race_registrations_admin_groups_path

        expect(page).to have_content("Update me")


        click_link "Edit this group"

        fill_in "Title", :with => "Updated"
        click_button "Save"

        expect(page).to have_content("'Updated' was successfully updated.")
      end
    end

    describe "destroy" do
      before { FactoryGirl.create(:group, :title => "Delete me") }

      it "removes group" do
        visit refinery.race_registrations_admin_groups_path

        click_link "Remove this group forever"

        expect(page).to have_content("'Delete me' was successfully removed.")

        expect(Refinery::RaceRegistrations::Group.count).to eq(0)
      end
    end

  end
end
