class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, {:presence => true,uniqueness: true, :length => { :maximum => 50 }})
  validates(:price, {:presence => true, :numericality => { only_integer: true }})
  validates :name, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }
  before_save(:capitalize_first_letters_name)

  scope(:not_done, ->do
    where({:done=>false})
  end)

  private

  def capitalize_first_letters_name
    name = self.name.split(" ")
    self.name = name.map{|word| word.capitalize}.join(" ")
  end

end
