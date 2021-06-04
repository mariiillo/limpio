# frozen_string_literal: true

RSpec.describe Limpio do
  it "has a version number" do
    expect(Limpio::VERSION).not_to be nil
  end

  it "removes keys with blank values from all levels" do
    hash = {
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

    expect(hash.deep_reject_blank!).to eq(
      key1: "value1",
      key3: {
        key4: "value4",
      },
      key11: [1.23],
      key12: [123, false, true],
      key13: true,
      key14: false
    )
  end
end
