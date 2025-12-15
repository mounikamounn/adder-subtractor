module ad_su_tb();
  reg [4:0] a, b;
  reg cin;
  wire[4:0] s;
  wire v;
  integer i, handle1, handle2;

  ad_su dut(a, b, s, cin, v); 
  
  task initialize;
  begin
    {a, b} = 0; cin = 0;
  end
  endtask
  
  task mode0;
  begin
    cin = 1'b0;
  end
  endtask

  task mode1;
  begin
    cin = 1'b1;
  end
  endtask

  task inputs(input [9:0] x);
  begin
    {a, b} = x;
  end
  endtask

  initial
  begin
    handle1 = $fopen("output.txt");
    handle2 = handle1 | 1;
    $fdisplay(handle2, "5-bit parallel adder/subtractor");

    initialize;
    mode0;
    $fdisplay(handle2, "5-bit adder");
    for (i = 0; i <= 1023; i = i + 1)
    begin
      {a, b} = i;
      #1;
      $fdisplay(handle2, "mode=%d cin=%d a=%d b=%d sum=%d v=%d", cin, cin, a, b, s, v);
    end

    mode1;
    $fdisplay(handle2, "5-bit subtractor");
    for (i = 0; i <= 1023; i = i + 1)
    begin
      {a, b} = i;
      #1;
      $fdisplay(handle2, "mode=%d cin=%d a=%d b=%d difference=%d v=%d", cin, cin, a, b, s, v);
    end

    $fclose(handle1);
    $finish;
  end
endmodule