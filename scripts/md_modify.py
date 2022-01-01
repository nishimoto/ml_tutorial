# modify table tag
import sys

flag = True
for line in open(sys.argv[1]):
    if line == "<div>\n":
        flag = False

    if line == "</div>\n":
        continue

    if line == "<table border=\"1\" class=\"dataframe\">\n":
        flag = True
        print(" - 出力")
        print("<table>")
        continue

    if line == "    <tr style=\"text-align: right;\">\n":
        print("    <tr>")
        continue

    if flag:
        print(line.replace("\n", ""))
