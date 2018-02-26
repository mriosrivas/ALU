`timescale 1ns / 1ps


module ALU(
    input [1:6] c,
    input [15:0] x,
    input [15:0] y,
    output [15:0] out,
    output zr,
    output ng
    );
    
// Your codes starts here

endmodule


module ALU_testbench(

    );
     reg [1:6] c;
     reg [15:0] x, y;
     wire [15:0] out;
     wire zr, ng;
     ALU dut(c, x, y, out, zr, ng);

    reg [15:0] out_reg;
initial
    begin
    c = 6'b000000;
    x = 16'hffff;
    y = 16'hf0f0;
    #10 c = 6'b101010; // out = 16'h0000; 
    #10 if (out_reg == 16'h0000)
           $display("Correcto");
        else
           $display("Incorrecto en c = 6'b%b", c);
    
    #10 c = 6'b111111; // out = 16'h0001;
    #10 if (out_reg == 16'h0001)
           $display("Correcto");
        else
           $display("Incorrecto en c = 6'b%b", c); 
              
    #10 c = 6'b111010; // out = 16'hffff;
    #10 if (out_reg == 16'hffff)
           $display("Correcto");
        else
           $display("Incorrecto en c = 6'b%b", c); 
                  
    #10 c = 6'b001100; // out = x;
    #10 if (out_reg == x)
           $display("Correcto");
        else
           $display("Incorrecto en c = 6'b%b", c);
                      
    #10 c = 6'b110000; // out = y;
    #10 if (out_reg == y)
           $display("Correcto");
        else
           $display("Incorrecto en c = 6'b%b", c);
                          
    #10 c = 6'b001101; // out = ~x;
    #10 if (out_reg == ~x)
           $display("Correcto");
        else
           $display("Incorrecto en c = 6'b%b", c);
                            
    #10 c = 6'b110001; // out = ~y;
    #10 if (out_reg == ~y)
           $display("Correcto");
        else
           $display("Incorrecto en c = 6'b%b", c);
              
    #10 c = 6'b001111; // out = ~(x + 16'hffff);
    #10 if (out_reg == ~(x + 16'hffff))
              $display("Correcto");
        else
              $display("Incorrecto en c = 6'b%b", c);
              
    #10 c = 6'b110011; // out = ~(y + 16'hffff);
    #10 if (out_reg == ~(y + 16'hffff))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
               
    #10 c = 6'b011111; // out = ~(~x + 16'hffff);
    #10 if (out_reg == ~(~x + 16'hffff))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                   
    #10 c = 6'b110111; // out = ~(~y + 16'hffff);
    #10 if (out_reg == ~(~y + 16'hffff))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                     
    #10 c = 6'b001110; // out = x + 16'hffff;
    #10 if (out_reg == (x + 16'hffff))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                         
    #10 c = 6'b110010; // out = y + 16'hffff;
    #10 if (out_reg == (y + 16'hffff))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                             
    #10 c = 6'b000010; // out = x + y;
    #10 if (out_reg == (x+y))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                                
    #10 c = 6'b010011; // out = ~(~x + y);
     #10 if (out_reg == ~(~x + y))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                                
    #10 c = 6'b000111; // out = ~(x + ~y);
    #10 if (out_reg == ~(x + ~y))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                                  
    #10 c = 6'b000000; // out = x&y;
    #10 if (out_reg == (x&y))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
                                  
    #10 c = 6'b010101; // out = ~(~x & ~y);
    #10 if (out_reg == ~(~x & ~y))
               $display("Correcto");
        else
               $display("Incorrecto en c = 6'b%b", c);
    end    
    
always @(*)
    out_reg = out;
endmodule
