require 'cfn-nag'

module Stax
  class Stack < Base

    COLORS = {
      WARN: :yellow,
      FAIL: :red,
    }

    no_commands do
      def cfn_nag
        @_cfn_nag ||= CfnNag.new
      end
    end

    desc 'nag', 'run nag for stack'
    def nag
      results = cfn_nag.audit(cloudformation_string: cfer_generate_string)
      print_table results[:violations].map { |v|
        [color(v.type, COLORS), v.logical_resource_ids.join(' '), v.id, v.message]
      }
      puts "#{results[:failure_count]} failures"
    end

  end
end