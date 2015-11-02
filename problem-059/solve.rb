#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Each character on a computer is assigned a unique code and the preferred standard is ASCII (American Standard Code
# for Information Interchange). For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
# 
# A modern encryption method is to take a text file, convert the bytes to ASCII, then XOR each byte with a given value,
# taken from a secret key. The advantage with the XOR function is that using the same encryption key on the cipher
# text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
# 
# For unbreakable encryption, the key is the same length as the plain text message, and the key is made up of random
# bytes. The user would keep the encrypted message and the encryption key in different locations, and without both
# "halves", it is impossible to decrypt the message.
# 
# Unfortunately, this method is impractical for most users, so the modified method is to use a password as a key.
# If the password is shorter than the message, which is likely, the key is repeated cyclically throughout the message.
# The balance for this method is using a sufficiently long password key for security, but short enough to be memorable.
# 
# Your task has been made easy, as the encryption key consists of three lower case characters. Using cipher.txt, a file
# containing the encrypted ASCII codes, and the knowledge that the plain text must contain common English words,
# decrypt the message and find the sum of the ASCII values in the original text.
#
# ---------------------------------------------------------------------------------------------------------------------
#
# Could be sped up by doing some frequency analysis on each possible letter of the key

def crypt(message, key)
  repeated_key = key * ((message.length+2) / key.length)

  #puts message.length
  #puts repeated_key.length
  
  (0..message.length-1).map{|i|
    message[i] ^ repeated_key[i]
  }

end

# slightly easier tests...
def crypt_string(message, key)
  crypt(
    message.split("").map{|c| c.ord},
    key.split("").map{|c| c.ord}
  ).map{|v| v.chr}.join
end


if __FILE__ == $0

  message = []
  File.readlines('in.txt').each do |line|
    line.split(",").each {|a| message.push a.to_i}
  end

  possible_keys = "abcdefghijklmnopqrstuvwxyz".split("").map{|c| c.ord}.repeated_permutation(3)

  possible_keys.each do |key|
    decrypted_message = crypt(message, key)
    # About 10 seconds, could be sped up a lot by not doing strings here
    s = decrypted_message.map{|v| v.chr}.join
    if s.include?(" the ") && s.include?(" of ")
      puts s
      puts decrypted_message.inject(:+)
      puts key.map{|v| v.chr}.join
    end
  end

end