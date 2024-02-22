// I HAVE NO IDEA WHY IT MAKES ME USE JDOODLE AS THE OBJECT NAME
object JDoodle {

  // Function to encrypt
  def encrypt(input: String, shiftAmount: Int): String = {
    var cipherText = ""
    // Convert the input string to uppercase
    val inputUpper = input.toUpperCase
    for (ch <- inputUpper) {
      if (ch >= 'A' && ch <= 'Z') {
        // Encrypt the string using the specified shift amount
        cipherText += ((ch - 'A' + shiftAmount) % 26 + 'A').toChar
      } else {
        cipherText += ch
      }
    }
    // Return the encrypted text
    cipherText
  }

  // Function to decrypt
  def solve(input: String, maxShiftValue: Int): Unit = {
    // Print the original input string with the maximum shift value
    println(s"Caesar $maxShiftValue: $input")
    // Iterate through each shift
    for (i <- maxShiftValue - 1 to 0 by -1) {
      val encrypted = encrypt(input, i)
      // Print the decrypted string with the current shift value
      println(s"Caesar $i: $encrypted")
    }
  }

  def main(args: Array[String]): Unit = {
    // Calls the solve function
    solve("HAL", 26)
  }
}
