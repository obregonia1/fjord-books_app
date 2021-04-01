# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:alice)
  end

  test 'editable?' do
    alice = users(:alice)
    assert @report.editable?(alice)

    she = users(:she)
    assert_not @report.editable?(she)
  end

  test 'created_on' do
    date = Date.new(2021, 3, 20)
    assert_equal date, @report.created_on
  end
end
