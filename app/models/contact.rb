class Contact < ApplicationRecord
  belongs_to :kind, optional: true
  has_many :phones

  # def kind_description
  #   self.kind.description
  # end

  # def as_json()
  #   super(
  #     root: true,
  #     except: [:kind_id],
  #     include: { kind: { only: :description } }
  #     # methods: [:kind_description]

  #   )

  # end
end
