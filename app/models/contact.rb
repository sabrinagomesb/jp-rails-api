class Contact < ApplicationRecord
  belongs_to :kind

  def kind_description
    self.kind.description
  end

  def as_json()
    super(
      root: true,
      except: [:kind_id],
      methods: [:kind_description]
      # include: { kind: { only: :description }
    )

  end

end
