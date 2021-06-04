# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe Limpio do
  it "has a version number" do
    expect(Limpio::VERSION).not_to be nil
  end

  context "for Hashes" do
    let(:hash) do
      {
        key1: "value1",
        key2: "",
        key3: {
          key4: "value4",
          key5: "",
          key6: {
            key7: {}
          }
        },
        key8: {},
        key9: nil,
        key10: [],
        key11: [nil, 1.23],
        key12: [nil, 123, false, true],
        key13: true,
        key14: false
      }
    end

    let(:output) do
      {
        key1: "value1",
        key3: {
          key4: "value4"
        },
        key11: [1.23],
        key12: [123, false, true],
        key13: true,
        key14: false
      }
    end

    it "removes recursively keys with nil & empty values" do
      expect(hash.deep_reject_blank!).to eq(output)
    end
  end

  context "for Arrays" do
    let(:array) do
      [
        "value1",
        "",
        {
          key4: "value4",
          key5: "",
          key6: {
            key7: {}
          }
        },
        {},
        nil,
        [],
        [nil, 1.23],
        [nil, 123, false, true],
        true,
        false
      ]
    end

    let(:output) do
      [
        "value1",
        {
          key4: "value4"
        },
        [1.23],
        [123, false, true],
        true,
        false
      ]
    end

    it "removes recursively nil & empty elements" do
      expect(array.deep_reject_blank!).to eq(output)
    end
  end
end
# rubocop:enable Metrics/BlockLength
