module Alexa
  class Card
    SIMPLE_CARD_TYPE   = "Simple"
    STANDARD_CARD_TYPE = "Standard"

    def initialize(title, body, image_url)
      @title     = title
      @body      = body
      @image_url = image_url
    end

    def self.hash(title, body, image_url = nil)
      new(title, body, image_url).to_h
    end

    def to_h
      Hash.new.tap do |card|
        set_type(card)
        card[:title] = @title
        set_body(card)
        set_image(card) if @image_url
      end
    end

    private

    def set_type(card)
      card[:type] = SIMPLE_CARD_TYPE if simple?
      card[:type] = STANDARD_CARD_TYPE if standard?
    end

    def set_body(card)
      card[:content] = @body if simple?
      card[:text]    = @body if standard?
    end

    def set_image(card)
      card[:image] = Hash.new
      card[:image][:smallImageUrl] = @image_url
      card[:image][:largeImageUrl] = @image_url
    end

    def simple?
      !@image_url
    end

    def standard?
      !!@image_url
    end
  end
end