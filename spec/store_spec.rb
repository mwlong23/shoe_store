require 'spec_helper'


describe(Store) do
  it("validates presence of name") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end
end

  describe(Store) do
    it("ensures the length of name is at most 101 characters") do
      store = Store.new({:name => "a".*(100)})
      expect(store.save()).to(eq(false))
    end
  end
  # describe(Task) do
  #   it("converts the name to lowercase") do
  #     task = Task.create({:description => "FINAGLE THE BUFFALO"})
  #     expect(task.description()).to(eq("finagle the buffalo"))
  #   end
  # end
