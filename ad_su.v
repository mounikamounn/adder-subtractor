module ad_su(a,b,s,cin,v);
  input [4:0] a, b;
  input cin;
  output v;
  output [4:0] s;
  wire [4:0] w, c;

  assign w[0] = b[0] ^ cin;
  assign w[1] = b[1] ^ cin;
  assign w[2] = b[2] ^ cin;
  assign w[3] = b[3] ^ cin;
  assign w[4] = b[4] ^ cin;

  fulladder f1(a[0], w[0], cin, s[0], c[0]);
  fulladder f2(a[1], w[1], c[0], s[1], c[1]);
  fulladder f3(a[2], w[2], c[1], s[2], c[2]);
  fulladder f4(a[3], w[3], c[2], s[3], c[3]);
  fulladder f5(a[4], w[4], c[3], s[4], c[4]);

  xor g1(v, c[4], c[3]);
endmodule