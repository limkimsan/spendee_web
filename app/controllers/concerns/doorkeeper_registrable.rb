# frozen_tsring_literal: true

module DoorkeeperRegistrable
  extend ActiveSupport::Concern

  def generate_refresh_token
    loop do
      # generte a random token string and return it
      # unless there is already another token with the same string

      token = SecureRandom.hex(32)
      break token unless Doorkeeper::AccessToken.exists?(refresh_token: token)
    end
  end

  def render_user(user, client_app, token_type = 'Bearer')
    access_token = Doorkeeper::AccessToken.create(resource_owner_id: user.id,
                                                  application_id: client_app.id,
                                                  refresh_token: generate_refresh_token,
                                                  scopes: '')

    {
      id: user.id,
      access_token: access_token.token,
      token_type: token_type,
      refresh_token: access_token.refresh_token,
      created_at: access_token.created_at.to_time.to_i
    }
  end
end