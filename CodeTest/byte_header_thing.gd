extends Node


var byte_message: PackedByteArray = "Gaming what is up gamers\r\n\r\n hahahsufhgousdh fdhsg ipsfgjpsi".to_utf8_buffer()

func _ready() -> void:
	print(Time.get_ticks_usec())
	var string_message: String = byte_message.get_string_from_utf8()
	string_message = string_message.erase(0, string_message.find("\r\n\r\n"))
	print(string_message)
	print(Time.get_ticks_usec())
	
	print(2 % 2)


	#print(Time.get_ticks_usec())
	#var current_search_index: int = 0
	#while current_search_index < byte_message.size():
		#var new_search_index = byte_message.find(13, current_search_index)
		#assert(new_search_index > current_search_index, "Could not find header")
		#current_search_index = new_search_index
		#if byte_message[current_search_index + 1] == 10 and byte_message[current_search_index + 2] == 13 and byte_message[current_search_index + 1] == 10:
			#byte_message = byte_message.slice(current_search_index)
			#break
		#current_search_index += 1
	#
	#var string_message: String = byte_message.get_string_from_utf8()
	#print(string_message)
	#print(Time.get_ticks_usec())

#in GDScript bc why tf not:   (python 
#```python
#const HEADER_END: Array[ = ["\r", "\n", "\r", "\n"]
#var reached_end := false
#var saved_header: String
#var current_header_index := 0
#for byte in byte_array:
  #if str(byte) == HEADER_END[current_header_index + 1]:
	#current_header_index += 1
	#if current_header_index == HEADER_END.size() - 1:
	  ## lookup the function for removing a specific character from the array and just loop through it to remove the header ending bytes (idk if they should be removed or not)
	  #break
  #else:
	#current_header_index = 0
  #
#print(saved_header) // or do wtvr you need the header for
#```
#OH SHIT I just realized you said removing the header holdup
#
#Aand after seeing go's implementation and looked at the docs I realized I'm just fukn stupid it's a byte not smth that can be implcitly turned into a character
