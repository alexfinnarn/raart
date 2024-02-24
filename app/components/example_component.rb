# frozen_string_literal: true

class ExampleComponent < ViewComponent::Base
  erb_template <<-ERB
    <span title="<%= @title %>"><%= content %></span>
  ERB

  def initialize(title:)
    super
    @title = title
  end

end
