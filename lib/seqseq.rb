require 'active_support/concern'

module SeqSeq
  module Base
    extend ActiveSupport::Concern

    included do
      def self.next_val(seq_name, criteria, opts = {})
        opts.reverse_merge!(:start_with => 1, :step_by => 1)
        throw ArgumentError, "start_with or step_by options must be integer" unless [:start_with, :step_by].all?{ |_| opts[_].is_a? Integer }

        result = nil
        begin
          rec = find_or_create_by_seq_name_and_criteria(seq_name.to_s, criteria.to_s)
          rec.with_lock do

            rec.start_with ||= opts[:start_with]
            rec.step_by    ||= opts[:step_by]

            result = (rec.next_val ||= rec.start_with)

            rec.next_val += rec.step_by
            rec.save!
          end
          result
        rescue ActiveRecord::RecordNotUnique
          retry
        end
      end
    end
  end
end
