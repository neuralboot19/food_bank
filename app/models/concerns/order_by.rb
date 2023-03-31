module OrderBy
  extend ActiveSupport::Concern

  included do
    ORDER_BY = {
      newest: "created_at DESC",
      updated_last: "updated_at DESC"
    }
  end
end
