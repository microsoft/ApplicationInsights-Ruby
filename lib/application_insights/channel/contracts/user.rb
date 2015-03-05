require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class User
    include JsonSerializable

    attr_accessor :account_acquisition_date, :account_id, :user_agent,
      :id, :store_region

    attribute_mapping(
      id: 'ai.user.id',
      account_id: 'ai.user.accountId',
      user_agent: 'ai.user.userAgent',
      store_region: 'ai.user.storeRegion',
      account_acquisition_date: 'ai.user.accountAcquisitionDate'
    )
  end
end
