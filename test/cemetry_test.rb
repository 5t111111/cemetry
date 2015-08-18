require 'test_helper'

class CemetryTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Cemetry::VERSION
  end

  def test_if_bpm_msec_is_assigned
    seq = Cemetry::Sequence.new(120)
    assert seq.bpm_msec
  end

  def test_if_proc_is_called
    proc_mock = Minitest::Mock.new
    proc_mock.expect(:call, 36)
    Cemetry::Sequence.new(120).play(proc_mock, only_once: true)
    assert proc_mock.verify
  end
end
