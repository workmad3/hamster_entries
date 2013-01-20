class RegistrationsController < Devise::RegistrationsController
  before_filter :add_cookie_acceptance, only: :create
  skip_before_filter :verify_authenticity_token, only: :create

  def add_cookie_acceptance
    response.set_cookie 'rack.policy', {
      value: 'true',
      path: '/',
      expires: 1.year.from_now.utc
    }
  end

  private :add_cookie_acceptance
end