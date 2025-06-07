

module GFM_2_freq_tb;

    
    reg clk1;
    reg clk2;
    reg select;
    reg rstn;

    
    wire clk_out;

    
    GFM_2_freq uut (
        .clk1(clk1),
        .clk2(clk2),
        .select(select),
        .rstn(rstn),
        .clk_out(clk_out)
    );

    
    initial 
	begin
        clk1 = 0;
        forever #5 clk1 = ~clk1; 
    	end

    initial 
	begin
        clk2 = 0;
        forever #10 clk2 = ~clk2; 
    	end

    
    initial begin
       
        rstn = 0;
        select = 0;

        #20;
        rstn = 1;

        #100;
        select = 1;

        #200;
        select = 0;

        #200;
        select = 1;
        #300;
        $stop;
    end

endmodule