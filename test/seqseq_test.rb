require 'test_helper'

class SeqseqTest < ActiveSupport::TestCase
  test 'module' do
    assert_kind_of Module, SeqSeq
    assert_kind_of Module, SeqSeq::Base
  end

  test 'version' do
    assert SeqSeq::VERSION.present?
  end

  test 'next_val' do
    [:seq_1, :seq_2, :seq_3].each do |seq|
      assert_equal AutoSequence.next_val(seq, 1), 1
      assert_equal AutoSequence.next_val(seq, 1), 2
      assert_equal AutoSequence.next_val(seq, 1), 3

      assert_equal AutoSequence.next_val(seq, 'x'), 1
      assert_equal AutoSequence.next_val(seq, 'x'), 2
      assert_equal AutoSequence.next_val(seq, 'x'), 3

      assert_equal AutoSequence.next_val(seq, 1), 4
      assert_equal AutoSequence.next_val(seq, 1), 5
      assert_equal AutoSequence.next_val(seq, 1), 6
    end
  end

  test 'start_with' do
    assert_equal AutoSequence.next_val(:seq, 1, start_with: 11), 11
    assert_equal AutoSequence.next_val(:seq, 1, start_with: 21), 12
    assert_equal AutoSequence.next_val(:seq, 1), 13
  end

  test 'step_by' do
    assert_equal AutoSequence.next_val(:seq, 1, step_by: 10), 1
    assert_equal AutoSequence.next_val(:seq, 1, step_by: 20), 11
    assert_equal AutoSequence.next_val(:seq, 1), 21
  end

  test 'start_with & step_by' do
    assert_equal AutoSequence.next_val(:seq, 1, start_with: 10, step_by: 5), 10
    assert_equal AutoSequence.next_val(:seq, 1, start_with: 20, step_by: 1), 15
    assert_equal AutoSequence.next_val(:seq, 1), 20
  end
end
