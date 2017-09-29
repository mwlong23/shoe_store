class Store <ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true, :length => { :maximum => 50 }})
  validates :name, uniqueness: true
  validates :name, uniqueness: { case_sensitive: false }
end
