text = open("message_file.txt", "r")
words = []
for line in text:
  words.append(line.strip("\n"))
words.sort()
res = ""
for i in range(len(words)):
  