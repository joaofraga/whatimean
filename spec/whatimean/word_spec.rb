require 'spec_helper'

describe WhatIMean::Word, :vcr do
  it 'instances a new word with allowed attributes' do
    expect( WhatIMean::Word.new name: "altavista",
                                hits: 2000,
                                rate: 0.85 ).to be_instance_of(WhatIMean::Word)
  end

  it 'does not instances a new word with not allowed attributes' do
    expect{ WhatIMean::Word.new name: "altavista",
                                hits: 2000,
                                rate: 0.85,
                                block: true }.to raise_error(NoMethodError)
  end

  it 'calculates rate from given total' do
    word = WhatIMean::Word.new name: "altavista", hits: 2000
    expect{ word.calculate_rate(10000) }.to change{word.rate}.from(nil).to(0.2)
  end
end
