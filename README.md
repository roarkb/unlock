unlock
======

programmatically hack a push button padlock

---------------------notes:

1:============ spaghetti hallway


test_data = [ 0123456789, 013456789, 012345789, 123456789 ]

string0 = 0u1u2u3u4u5u6u7u8u9u-r-013u4u5u6u7u8u9u-r-0123457u8u9u-r-
string1 = 1u2u3u4u5u6u7u8u9-r-
string2 = 
...

stack = 
stack_to_string? = false
current_string = string1


for each combo
	set current_string based on first char of combo

	for each char
		if stack is empty
			if stack_to_string flag not set
				search for char in string
					if its not there than append char followed by a "U" !
					if it is there than add char to the stack !
			if stack_to_string flag is set
				append char to string followed by a "U" !
		if stack is not empty then:
			- append char to stack
			- search for individual stack values in string sequentially until you find them or hit an "R"
					all stack values found and no R!
						all stack values not found
							- append stack value to string followed by a "U"
							- empty stack, 
							- set stack_to_string flag
							- !


					if you hit an "R" than:
						- append stack value to string followed by a "U"
						- empty stack, 
						- set stack_to_string flag
						- !
	
	after each combo:
	- append an "R" to string
	- unset stack_to_string flag
	- stack should be empty

concat all strings



2:======== awesome (fail)

test_data = [ 0123456789, 012345789, 123456789 ]

list = 0u1u2u3u4u5u6u7u8u9u-r-0123457u8u9u-r-1u2u3u4u5u6u7u8u9u

tried_combos = [ 0, 01, 012, 0123, 01234, 012345, 0123456, 01234567, 012345678, 0123456789, 0123457, 01234578, 012345789, 1, 12, 123, 1234, 12345, 123456, 1234567, 12345678, 123456789


each combo
	each char
		1. add char to list
		2. gather all numbers in list between the last "R" (or beginning) and current position - in tried_combos?
				yes !				
				no
					- append a "U"
					- add to tried_combos

after each combo:
	- append an "R" to string
