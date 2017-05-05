require 'alexa/card'

RSpec.describe Alexa::Card do
  subject(:card) { described_class.hash }

  describe '.hash' do
    it 'generates a Simple card given only a title and body' do
      expected_result = { 
        type: "Simple", 
        title: "Hello Card", 
        content: "Hello, string!" 
      }

      simple_card = described_class.hash("Hello Card", "Hello, string!")
      expect(simple_card).to eq expected_result
    end

    it 'generates a Standard card given title, body, and an image URL' do
      expected_result = {
        type: "Standard", 
        title: "Hello Card", 
        text: "Hello, string!", 
        image: { 
          smallImageUrl: "http://example.com/image.jpg",
          largeImageUrl: "http://example.com/image.jpg"
        }
      }

      standard_card = described_class.hash("Hello Card", "Hello, string!", "http://example.com/image.jpg")
      expect(standard_card).to eq expected_result
    end
  end
end