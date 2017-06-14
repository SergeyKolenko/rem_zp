require 'rails_helper'

RSpec.describe ProposalsController, type: :controller do
  describe 'routing' do

    it do
      should route(:get, root_path).
          to( controller: 'proposals', action: 'index' )
    end
  end
end
