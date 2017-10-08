require 'spec_helper'


describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end

  it("ensures the length of name is at most 101 characters") do
    store = Store.new({:name => "a".*(100)})
    expect(store.save()).to(eq(false))
  end

  it 'checks # capitalize_first_letters_name' do
    store = Store.new({name: "walmart"})
    store.save()
    expect(store.name).to(eq("Walmart"))
  end
  # it {should have_many_and_belong_to_many(:brands) }
end
