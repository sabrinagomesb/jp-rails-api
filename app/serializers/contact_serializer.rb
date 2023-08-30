class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate, :author

  belongs_to :kind, optional: true do
    link(:related) { kind_url(object.kind.id) }
  end

  has_many :phones
  has_one :address

  link(:self) { contact_url(object.id) }

 def author
  'Sabrina Gomes'
 end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
