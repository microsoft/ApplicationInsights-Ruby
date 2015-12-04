require_relative 'json_serializable'

module ApplicationInsights::Channel::Contracts
  class User
    include JsonSerializable

    attr_accessor :account_acquisition_date, :account_id, :auth_user_id, :user_agent, :id,
      :store_region

    attribute_mapping(
      account_acquisition_date: 'ai.user.accountAcquisitionDate',
      account_id: 'ai.user.accountId',
      user_agent: 'ai.user.userAgent',
      id: 'ai.user.id',
      auth_user_id: 'ai.user.authUserId',
      store_region: 'ai.user.storeRegion'
    )
  end
end
