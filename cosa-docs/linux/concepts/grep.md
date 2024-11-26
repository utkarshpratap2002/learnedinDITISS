# `grep` 

Here’s a layman description of the commands found in your `commands_history.txt` file:

1. **`cat taste.txt`**: This command displays the entire content of the `taste.txt` file on the screen.

2. **`grep "cake" taste.txt`**: Searches for the word "cake" in the `taste.txt` file and shows any lines containing that word.

3. **`grep "good" taste.txt`**: Searches for the word "good" in `taste.txt`.

4. **`grep "is" taste.txt`**: Searches for the word "is" in `taste.txt`.

5. **`grep -w "is" taste.txt`**: Looks specifically for the **whole word** "is" in `taste.txt`, ignoring "this" or "isn't".

6. **`grep -n "is" taste.txt`**: Similar to the previous command, but also shows the **line number** where "is" appears.

7. **`grep -v "is" taste.txt`**: Shows all lines in `taste.txt` **except** those that contain "is".

8. **`grep "Is" taste.txt`**: Searches for "Is" with an uppercase "I" in `taste.txt`.

9. **`grep -i "Is" taste.txt`**: Searches for "Is" but ignores **case sensitivity**, meaning it will find "Is" and "is".

10. **`grep "^is" taste.txt`**: Finds lines that **start** with "is" in `taste.txt`.

11. **`grep "is$" taste.txt`**: Finds lines that **end** with "is" in `taste.txt`.

12. **`grep "^is$" taste.txt`**: Finds lines that **only** contain the word "is" in `taste.txt`.

13. **`cat > select.txt`**: Creates or overwrites a file named `select.txt` and lets you type text into it (the input ends when you press `Ctrl+D`).

14. **`cat select.txt`**: Displays the content of `select.txt` on the screen.

15. **`grep "bg" select.txt`**: Searches for the text "bg" in `select.txt`.

16. **`grep "bag" select.txt`**: Searches for the word "bag" in `select.txt`.

17. **`grep "beg" select.txt`**: Searches for the word "beg" in `select.txt`.

18. **`grep "bug" select.txt`**: Searches for the word "bug" in `select.txt`.

19. **`grep "b[aeu]g" select.txt`**: Searches for any word in `select.txt` that starts with "b" and ends with "g", and has any of the letters **a**, **e**, or **u** in between (e.g., "bag", "beg", "bug").

20. **`grep "b[^aeu]g" select.txt`**: Searches for any word in `select.txt` that starts with "b" and ends with "g", but has any letter **except** **a**, **e**, or **u** in between.

21. **`grep "b.g" select.txt`**: Searches for any word in `select.txt` that starts with "b" and ends with "g" and has any **one character** in between (e.g., "bag", "beg", "bug").

22. **`grep "b*g" select.txt`**: Searches for "b", followed by **zero or more** "b"s, and ending with "g" (e.g., "bg", "bbg", "bbbbbg").

23. **`grep "b\*g" select.txt`**: Searches for the **literal** pattern "b\*g" (b, asterisk, g).

24. **`grep "b[*]g" select.txt`**: Also searches for "b\*g" (literal asterisk between "b" and "g").

25. **`grep -F "b*g" select.txt`**: Searches for the **exact text** "b*g" (interprets the asterisk as a normal character, not a wildcard).

26. **`fgrep "b*g" select.txt`**: Same as `grep -F`, searches for the exact text "b*g".

27. **`grep -w "b*g" select.txt`**: Looks for the **whole word** "b*g" in `select.txt`.

28. **`cat > repeat.txt`**: Creates or overwrites the file `repeat.txt` and lets you enter text manually.

29. **`cat repeat.txt`**: Displays the content of `repeat.txt`.

30. **`grep "bg" repeat.txt`**: Searches for "bg" in `repeat.txt`.

31. **`grep "bag" repeat.txt`**: Searches for "bag" in `repeat.txt`.

32. **`grep "baag" repeat.txt`**: Searches for "baag" in `repeat.txt`.

33. **`grep "b*g" repeat.txt`**: Searches for "b", followed by zero or more characters, and ending with "g".

34. **`grep "ba?g" repeat.txt`**: Searches for "b", followed by **zero or one** "a", and ending with "g" (matches "bg" and "bag").

35. **`grep -E "ba?g" repeat.txt`**: Same as above, using **extended regular expressions** (the `-E` flag enables these).

36. **`egrep "ba?g" repeat.txt`**: Same as `grep -E "ba?g"`, it’s another version of the command with extended regex.

37. **`egrep "ba+g" repeat.txt`**: Searches for "b", followed by **one or more** "a"s, and ending with "g".

38. **`egrep "ba{3}g" repeat.txt`**: Searches for "b", followed by exactly **three "a"**s, and ending with "g" (matches "baaag").

39. **`egrep "ba{4}g" repeat.txt`**: Searches for "b", followed by exactly **four "a"**s, and ending with "g" (matches "baaaag").

40. **`egrep "ba{3,5}g" repeat.txt`**: Searches for "b", followed by between **three and five** "a"s, and ending with "g" (matches "baaag", "baaaag", and "baaaaag").

41. **`egrep "ba{3,}g" repeat.txt`**: Searches for "b", followed by **three or more** "a"s, and ending with "g" (matches "baaag" or more "a"s).

42. **`egrep "ba{,4}g" repeat.txt`**: Searches for "b", followed by **up to four "a"s**, and ending with "g".

43. **`egrep "bg" repeat.txt`**: Searches for "bg" in `repeat.txt`.

44. **`egrep "baag" repeat.txt`**: Searches for "baag" in `repeat.txt`.

45. **`egrep "b[aa]g" repeat.txt`**: Searches for "b", followed by either one or two "a"s, and ending with "g".

46. **`egrep "b(aa)g" repeat.txt`**: Searches for "b", followed by the **exact sequence "aa"**, and ending with "g".

47. **`egrep "b(aa){2}g" repeat.txt`**: Searches for "b", followed by exactly **two occurrences of "aa"** (i.e., "baaaag").

48. **`egrep "b[aa]{2}g" repeat.txt`**: Similar to the above, searches for "b", followed by exactly two occurrences of either one "a" or two "a"s.

49. **`egrep "(good|cake)" taste.txt**: Searches for either the word "good" or "cake" in `taste.txt`.

50. **`egrep "good|cake" taste.txt`**: Same as above, searches for either "good" or "cake".

51. **`grep "is" *`**: Searches for "is" in all files in the current directory.

52. **`grep "is" ~/aug2024/ditiss/*`**: Searches for "is" in all files located in the `~/aug2024/ditiss/` directory.

53. **`grep -r "is" .`**: Recursively searches for "is" in the current directory and all its subdirectories.

54. **`grep -r "is" ..`**: Recursively searches for "is" in the parent directory and all its subdirectories.

55. **`grep -C 2 "search-pattern" file.txt`**: Displays the two line before and after the line that find the searched *pattern*. 

56. **`grep -A 2 -B 2 "search-pattern" file.txt`**: Displays the same thing, but here you can specifically specify the number for both after and before.
