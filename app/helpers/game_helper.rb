module GameHelper
	def self.load(game)
		piece_location = {}
		@game = Game.find(game)
		@game.pieces.each do |piece|
			piece_location	<< piece.id[piece.location]
		end
		piece_location
	end

end
