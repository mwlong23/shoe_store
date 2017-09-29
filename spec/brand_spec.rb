require 'spec_helper'


describe(Brand) do
  it("validates presence of description") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
  end
end
describe(Brand) do
  it("ensures the length of name is at most 101 characters") do
    brand = Brand.new({:name => "a".*(100)})
    expect(brand.save()).to(eq(false))
  end
end

# describe(Task) do
#   it("converts the name to lowercase") do
#     task = Task.create({:description => "FINAGLE THE BUFFALO"})
#     expect(task.description()).to(eq("finagle the buffalo"))
#   end
# end
