module CodeValidations
  extend ActiveSupport::Concern

  included do
    validates :code, presence: true, uniqueness: true,
              format: { with: /\A(?!_)[a-z_]+/, message: I18n.t('shared.errors.wrong_format') }
  end

end