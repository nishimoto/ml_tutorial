import sys

str_replaced_before = """```

    """

str_replaced_after = """```

 - 出力
"""

all_strs = open(sys.argv[1]).read()

print(all_strs.replace(str_replaced_before, str_replaced_after))