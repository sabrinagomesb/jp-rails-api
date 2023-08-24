class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def as_json(options = {})
    hash = super(options)
    hash[:birthdate] = (I18n.l(birthdate) unless birthdate.blank?)
    hash
  end

  def kind_description
    kind.description
  end

  # def as_json()
  #   super(
  #     root: true,
  #     except: [:kind_id],
  #     include: { kind: { only: :description } }
  #     # methods: [:kind_description]

  #   )

  # end
end
