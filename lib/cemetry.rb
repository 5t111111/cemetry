require "cemetry/version"
require "miserable"
require "osc-ruby"
require "noone"

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
        note = Noone::NOTE_TABLE[proc.call]
        osc_client.send(OSC::Message.new("/sequence", note))
        sleep(@bpm_msec.quarter_note / 1_000)
        break if only_once
      end
    end
  end
end
