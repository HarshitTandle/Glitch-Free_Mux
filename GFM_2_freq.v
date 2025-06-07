module GFM_2_freq 
(
    input  wire clk1,       
    input  wire clk2,       
    input  wire select,     
    input  wire rstn,      
    output wire clk_out     
);

    wire d12c;
    wire d22c;
    wire nselect = ~select;

    reg d11, d12;
    always @(posedge clk1 or negedge rstn) 
    begin
        if (!rstn) 
        begin
            d11 <= 1'b0;
        end 
        else 
        begin
            d11 <= (select & d22c);
        end
    end

    always @(negedge clk1 or negedge rstn) 
    begin
        if (!rstn) 
        begin
            d12 <= 1'b0;
        end 
        else 
        begin
            d12 <= d11;
        end
    end

     assign d12c = ~d12;

    reg d21, d22;
    always @(posedge clk2 or negedge rstn) 
    begin
        if (!rstn) 
        begin
            d21 <= 1'b0;
        end 
        else 
        begin
            d21 <= (nselect & d12c); 
        end
    end

    always @(negedge clk2 or negedge rstn) 
    begin
        if (!rstn) 
        begin
            d22 <= 1'b0;
        end 
        else 
        begin
            d22 <= d21;
        end
    end
    
     assign d22c = ~d22;

    wire clk1_out = clk1 & d12;
    wire clk2_out = clk2 & d22;

    assign clk_out = clk1_out | clk2_out;

endmodule


