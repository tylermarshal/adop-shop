require 'rails_helper'

describe "When an Admin User navigates to analytics dashboard" do
  it "the Admin can see User breakdown" do
    admin = create(:user, role: 1)
    user1 = create(:user)
    user2 = create(:user)
    order1 = create(:order, user: user1)
    order2 = create(:order, user: user1)
    order3 = create(:order, user: user2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_analytics_dashboard_path

    expect(page).to have_content(user1.name)
  end

  it "the Admin user can see Category analytics" do
    admin = create(:user, role: 1)
    user1 = create(:user)
    user2 = create(:user)
    dog1 = create(:dog, price: 50)
    dog2 = create(:dog, price: 100)
    dog3 = create(:dog, price: 150)
    category1 = create(:category, title: "Working Dog")
    category2 = create(:category, title: "Toy")
    dog_category1 = create(:dog_category, dog: dog1, category: category1)
    dog_category2 = create(:dog_category, dog: dog2, category: category2)
    dog_category3 = create(:dog_category, dog: dog3, category: category2)
    order1 = create(:order, user: user1)
    order2 = create(:order, user: user2)
    order_dog1 = create(:order_dog, dog: dog1, order: order1)
    order_dog2 = create(:order_dog, dog: dog2, order: order2)
    order_dog3 = create(:order_dog, dog: dog3, order: order2)

    expect(page).to have_content("Most Expensive Working Dog : #{dog}")
  end
end