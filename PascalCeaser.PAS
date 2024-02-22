program CaesarSolver;

uses
  SysUtils;

// Function to encrypt
function encrypt(input: string; shiftAmount: integer): string;
var
  i: integer;
  ch: char;
  cipherText: string;
begin
  cipherText := '';
  // Convert the input string to uppercase
  input := UpperCase(input);
  for i := 1 to Length(input) do
  begin
    ch := input[i];
    if ch in ['A'..'Z'] then
      // Encrypt the string using the specified shift amount
      cipherText := cipherText + chr(((ord(ch) - ord('A') + shiftAmount) mod 26) + ord('A'))
    else
      cipherText := cipherText + ch;
  end;
  // Return the encrypted text
  encrypt := cipherText;
end;

// procedure to decrypt
procedure solve(input: string; maxShiftValue: integer);
var
  i: integer;
  encrypted: string;
begin
  // Print the original input string with the maximum shift value
  writeln('Caesar ', maxShiftValue, ': ', input);
  // Iterate through each shift
  for i := maxShiftValue - 1 downto 0 do
  begin
    encrypted := encrypt(input, i);
    // Print the dencrypted string with the current shift value
    writeln('Caesar ', i, ': ', encrypted);
  end;
end;

begin
  // Calls the solve procedure
  solve('IBM', 26);
end.
