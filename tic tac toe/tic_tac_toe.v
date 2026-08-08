module tic_tac_toe (
    input        clk,
    input        reset,
    input        move_valid,
    input  [3:0]  position,

    output reg [17:0] board,
    output reg        player,
    output reg [1:0]  winner,
    output reg        game_over
);

integer i;

reg [1:0] cells [0:8];
reg [3:0] moves;

reg win_found;

always @(posedge clk or posedge reset) begin

    if (reset) begin

        board     <= 18'b0;
        player    <= 1'b0;
        winner    <= 2'b00;
        game_over <= 1'b0;
        moves     <= 4'd0;

        for (i = 0; i < 9; i = i + 1)
            cells[i] <= 2'b00;

    end

    else if (move_valid && !game_over && position < 9) begin

        // Check whether position is empty
        if (cells[position] == 2'b00) begin

            // Player 1 = 01
            // Player 2 = 10
            if (player == 1'b0)
                cells[position] <= 2'b01;
            else
                cells[position] <= 2'b10;

            moves <= moves + 1'b1;

            // Change player
            player <= ~player;

        end

    end

end

// Board and winner calculation
always @(*) begin

    board = 18'b0;
    winner = 2'b00;
    win_found = 1'b0;

    // Convert cell array into board output
    for (i = 0; i < 9; i = i + 1)
        board[i*2 +: 2] = cells[i];

    // Player 1 winning combinations
    if ((cells[0] == 2'b01 && cells[1] == 2'b01 && cells[2] == 2'b01) ||
        (cells[3] == 2'b01 && cells[4] == 2'b01 && cells[5] == 2'b01) ||
        (cells[6] == 2'b01 && cells[7] == 2'b01 && cells[8] == 2'b01) ||
        (cells[0] == 2'b01 && cells[3] == 2'b01 && cells[6] == 2'b01) ||
        (cells[1] == 2'b01 && cells[4] == 2'b01 && cells[7] == 2'b01) ||
        (cells[2] == 2'b01 && cells[5] == 2'b01 && cells[8] == 2'b01) ||
        (cells[0] == 2'b01 && cells[4] == 2'b01 && cells[8] == 2'b01) ||
        (cells[2] == 2'b01 && cells[4] == 2'b01 && cells[6] == 2'b01)) begin

        winner = 2'b01;
        win_found = 1'b1;

    end

    // Player 2 winning combinations
    else if ((cells[0] == 2'b10 && cells[1] == 2'b10 && cells[2] == 2'b10) ||
             (cells[3] == 2'b10 && cells[4] == 2'b10 && cells[5] == 2'b10) ||
             (cells[6] == 2'b10 && cells[7] == 2'b10 && cells[8] == 2'b10) ||
             (cells[0] == 2'b10 && cells[3] == 2'b10 && cells[6] == 2'b10) ||
             (cells[1] == 2'b10 && cells[4] == 2'b10 && cells[7] == 2'b10) ||
             (cells[2] == 2'b10 && cells[5] == 2'b10 && cells[8] == 2'b10) ||
             (cells[0] == 2'b10 && cells[4] == 2'b10 && cells[8] == 2'b10) ||
             (cells[2] == 2'b10 && cells[4] == 2'b10 && cells[6] == 2'b10)) begin

        winner = 2'b10;
        win_found = 1'b1;

    end

    // Game over condition
    if (win_found)
        game_over = 1'b1;

    else if (moves == 9)
        game_over = 1'b1;

    else
        game_over = 1'b0;

end

endmodule