module Storytime
  class SnippetPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @snippet = record
    end

    def index?
      manage?
    end

    def create?
      manage?
    end

    def new?
      manage?
    end

    def update?
      manage?
    end

    def edit?
      manage?
    end

    def destroy?
      manage?
    end

    def manage?
      action = Storytime::Action.find_by(guid: "5qg25i")
      role = @user.storytime_role_in_site(Storytime::Site.current)
      role.present? && role.allowed_actions.include?(action)
    end

    def permitted_attributes
      [:name, :content]
    end
  end
end
