module FlipFlopD(
    input preset,
    input reset,
    input D,
    input Clock,
    output reg Q
);

    always @(posedge Clock) begin
        if (reset) begin
            Q <= 0;
        end
        else if (preset) begin
            Q <= 1;
        end
        else begin
            Q <= D;
        end
    end

endmodule
