class SobreController < ApplicationController
  def index
    @titulo = "Pontualidade médica"
    @paragrafos = [
      "Pontualidade médica é isso aí"
    ]
  end
end
