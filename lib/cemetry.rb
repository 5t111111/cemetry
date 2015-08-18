require "cemetry/version"
require "miserable"
require "osc-ruby"

module Cemetry
  class Sequence
    attr_reader :bpm_msec

    def initialize(bpm)
      @bpm_msec = Miserable.new(bpm)
    end

    def play(proc, only_once: nil)
      begin
        osc_client = OSC::Client.new("localhost", 2345)
      rescue SocketError => e
        puts e.message
        retry
      end
      loop do
        osc_client.send(OSC::Message.new("/sequence", proc.call))
        sleep(@bpm_msec.quarter_note / 1_000)
        break if only_once
      end
    end
  end
end
