require 'spec_helper'

describe WhatIMean::Find, :vcr do
  let(:client){ WhatIMean::Google.new(GOOGLE_API_KEY) }
  let(:wim_find){ WhatIMean::Find.new client, 'google', 'yahoo', 'cade', 'altavista' }

  it 'creates new instances' do
    expect(WhatIMean::Find).to respond_to(:new)
  end

  it 'assigns a list of WhatIMean::Word to @words' do
    expect(wim_find.words).to be_instance_of(Array)
    wim_find.words.each do |word|
      expect(word).to be_instance_of(WhatIMean::Word)
    end
  end

  it 'calculate words occurrence rate' do
    total = wim_find.words.map(&:hits).inject(&:+).to_f
    wim_find.words.each do |word|
      expect(word.rate).to eq(word.hits / total)
    end
  end

  it 'sorts word by occurrence rate' do
    higher = 1
    wim_find.words.each do |word|
      expect(word.rate).to be < higher
      higher = word.rate
    end
  end

  describe 'winner' do
    it 'returns word with most number occurrences' do
      winner = wim_find.words.select{ |w| w.name == 'google' }.first
      expect(wim_find.winner).to eq(winner)
    end
  end
end
