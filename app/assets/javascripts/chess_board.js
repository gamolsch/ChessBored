var WHITE_KING = 100;
var WHITE_QUEEN = 90;
var WHITE_ROOK = 50;
var WHITE_BISHOP = 31;
var WHITE_KNIGHT = 30;
var WHITE_PAWN = 10;

var BLACK_KING = -WHITE_KING;
var BLACK_QUEEN = -WHITE_QUEEN;
var BLACK_ROOK = -WHITE_ROOK;
var BLACK_BISHOP = -WHITE_BISHOP;
var BLACK_KNIGHT = -WHITE_KNIGHT;
var BLACK_PAWN = -WHITE_PAWN;

var board = [[BLACK_ROOK, BLACK_KNIGHT, BLACK_BISHOP, BLACK_QUEEN, BLACK_KING, BLACK_BISHOP, BLACK_KNIGHT, BLACK_ROOK],
             [BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN],
             [0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0],
             [0,0,0,0,0,0,0,0],
             [WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN],
             [WHITE_ROOK, WHITE_KNIGHT, WHITE_BISHOP, WHITE_QUEEN, WHITE_KING, WHITE_BISHOP, WHITE_KNIGHT, WHITE_ROOK]];


function getsquareName(squareValue){
    switch (squareValue) {
        case WHITE_KING:
            return 'WHITE_KING';
            break;
        case WHITE_QUEEN:
            return 'WHITE_QUEEN';
            break;
        case WHITE_ROOK:
            return 'WHITE_ROOK';
            break;
        case WHITE_BISHOP:
            return 'WHITE_BISHOP';
            break;
        case WHITE_KNIGHT:
            return 'WHITE_KNIGHT';
            break;
        case WHITE_PAWN:
            return 'WHITE_PAWN';
            break;

        case BLACK_KING:
            return 'BLACK_KING';
            break;
        case BLACK_QUEEN:
            return 'BLACK_QUEEN';
            break;
        case BLACK_ROOK:
            return 'BLACK_ROOK';
            break;
        case BLACK_BISHOP:
            return 'BLACK_BISHOP';
            break;
        case BLACK_KNIGHT:
            return 'BLACK_KNIGHT';
            break;
        case BLACK_PAWN:
            return 'BLACK_PAWN';
            break;

        default:
            return 'EMPTY';
            break;
    }
}
var activeplayer = "white"

$(function(){
  drawBoard(board)
})

function drawBoard(board){
    var num = 1;
    var str = '';
    //building rows
    for( var i = 0 ; i < 8 ; i++ ){
      str += '<div class="row">';
    //building columns
    for( var j = 0 ; j < 8 ; j++ ){
      str += '<div id=' + num++ + ' class="column ' +
      ( (i + j) % 2 === 0 ? 'light': 'dark') + '">' +
      '<div class="piece ' + getsquareName(board[i][j]) + '"></div>' +
      '</div>';
    }
    str += '</div>';
    }
  $('#board').append(str);
};






$(function gameLogic(){
  
  var squareSelector = '#18'
  var originalColor = $(squareSelector).css('background-color');
  $('[class*=" BLACK"]').draggable({
    revert:true,
  })
  $('[class*=" BLACK"]').draggable( 'disable' )
  $('[class*=" WHITE"]').draggable({
  revert: true,
  
  start: function(e, ui) {
    var current_piece = ui.helper[0]
    console.log(parse_piece_information(current_piece));
    // class_array = current_piece.className.split(" ")[1];
    // var piece_id = current_piece.parentNode.id;
    // var piece_info = class_array.match(/(.*)(_)(.*)/);
    // var piece_color = (piece_info[1]).toLowerCase();
    // var piece_type = (piece_info[3]).toLowerCase();
    
    // console.log(piece_id);
    // console.log(piece_color);
    // console.log(piece_type);


function parse_piece_information(current_piece){
    class_array = current_piece.className.split(" ")[1];
    var piece_id = current_piece.parentNode.id;
    var piece_info = class_array.match(/(.*)(_)(.*)/);
    var piece_color = (piece_info[1]).toLowerCase();
    var piece_type = (piece_info[3]).toLowerCase();
    var info = {piece_id: piece_id, piece_color: piece_color, piece_type: piece_type}
    return info
    // return {piece_id: piece_id, piece_color: piece_color, piece_type: piece_type}
}


      $.ajax({
        type: "POST",
        url: "/get_piece_info",
        data: parse_piece_information,
        complete: {},
        success: function(response){
          console.log("am i even here?");
        }
      })


    $(squareSelector).droppable({
      //send back the location (parent div id) and piece type 
      //get possibilties from ajax
      //determine possibilities based on other pieces
      //color possibilities
      drop: function( event, ui) {
        //switch colors function (also make function that initiates white as active)
        //conditional logic determining whether a piece dies (if so send and store piece information, remove piece png from dom)
        //determine possibilities (and check to see if king is one of them - if so, that is a check)
          //if king check = king is only active piece on next turn 
            //get all possibilities for all pieces of opposing color (these mark the places where the king cannot go) 

      var $piece = ui.draggable
      $piece.appendTo($(squareSelector))

      switch (activeplayer){
        case "white":
            activeplayer = "black"
            $('[class*=" WHITE"]').draggable( 'disable' )
            $('[class*=" BLACK"]').draggable( 'enable' )
          break;
        case "black":
            activeplayer = "white"
            $('[class*=" WHITE"]').draggable( 'enable' )
            $('[class*=" BLACK"]').draggable( 'disable' )
          break;
      }
    },
 
//NOTES
//javascript objects in arrays (black and white) iterate (piece type, location, color, first_move, dead)
//

    deactivate: function( event, ui ) {
      $(squareSelector).css('background-color', originalColor)
    }
    }).css("background-color", "yellow")
  },
});

$('.EMPTY').remove();

})
