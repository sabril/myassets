module Columns
  extend ActiveSupport::Concern
  included do
    class << self
      def columns
        self.fields.collect{|c| c[1]}
      end
    end
  end
end