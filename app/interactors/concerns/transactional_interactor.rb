module TransactionalInteractor
  extend ActiveSupport::Concern

  included do
    around do |interactor|
      if ActiveRecord::Base.connection.open_transactions == ENV.fetch("OPEN_TRANSACTIONS_COUNT", 0).to_i
        ActiveRecord::Base.transaction do
          interactor.call(context)
        end
      else
        interactor.call(context)
      end
    end
  end
end
