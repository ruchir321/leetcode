from typing import List

def addSpaces(s: str, spaces: List[int]) -> str:
    st = []
    j = 0
    for i, char in enumerate(s):
        if j < len(spaces) and i == spaces[j]:
            st.append(' ')
            j += 1
        st.append(char)
    print(''.join(st))

addSpaces("LeetcodeHelpsMeLearn", [8,13,15])


# Why does this solution work for time complexity constraint:
#     class Solution:
#     def addSpaces(self, s: str, spaces: List[int]) -> str:
#         st = []
#         j = 0
#         for i, char in enumerate(s):
#             if j < len(spaces) and i == spaces[j]:
#                 st.append(' ')
#                 j += 1
#             st.append(char)
        
#         return ''.join(st)

# And this does not:
#     class Solution:
#     def addSpaces(self, s: str, spaces: List[int]) -> str:
#         st = ""
#         j = 0
#         for i, char in enumerate(s):
#             if i in spaces:
#                 st = st + " " + char
#                 j = i
#             st = st + char
        
#         return st