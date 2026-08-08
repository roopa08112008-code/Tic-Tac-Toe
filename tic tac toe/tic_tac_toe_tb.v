`timescale 1ns/1ps

module tic_tac_toe_tb;

reg clk;
reg reset;
reg move_valid;
reg [3:0] position;

wire [17:0] board;
wire player;
wire [1:0] winner;
wire game_over;

tic_tac_toe uut (
    .clk(clk),
    .reset(reset),
    .move_valid(move_valid),
    .position(position),
    .board(board),
    .player(player),
    .winner(winner),
    .game_over(game_over)
);

// Clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Task for making a move
task make_move;
    input [3:0] pos;
    begin
        position = pos;
        move_valid = 1'b1;
        #10;
        move_valid = 1'b0;
        #2;

        $display("Time=%0t | Position=%d | Board=%018b | Player=%b | Winner=%b | Game Over=%b",
                 $time, position, board, player, winner, game_over);
    end
endtask

initial begin

    $display("------------------------------------------------------------");
    $display("                 TIC-TAC-TOE SIMULATION");
    $display("------------------------------------------------------------");

    // Reset
    reset = 1'b1;
    move_valid = 1'b0;
    position = 4'd0;

    #10;

    reset = 1'b0;

    // Player 1 -> position 0
    make_move(0);

    // Player 2 -> position 1
    make_move(1);

    // Player 1 -> position 3
    make_move(3);

    // Player 2 -> position 4
    make_move(4);

    // Player 1 -> position 6
    // Player 1 wins with first column: 0,3,6
    make_move(6);

    #10;

    $display("------------------------------------------------------------");

    if (winner == 2'b01)
        $display("RESULT: PLAYER 1 WINS!");

    else if (winner == 2'b10)
        $display("RESULT: PLAYER 2 WINS!");

    else if (game_over)
        $display("RESULT: DRAW!");

    else
        $display("RESULT: GAME IN PROGRESS.");

    $display("------------------------------------------------------------");
    $display("Simulation Completed Successfully.");
    $display("------------------------------------------------------------");

    $finish;

end

endmodule