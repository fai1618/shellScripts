#!/bin/sh

text=$1

if test $# -ne 1
	then
		echo "引数の数が違います($#個)"
	else

		curl "https://api.voicetext.jp/v1/tts" \
			-o "asdfghjkl123456789.wav" \
			-u "kn06cx7vqhvosn0d:" \
			-d "text=${text}" \
			-d "speaker=hikari" \
				#man{show,takeru}
				#woman{haruka,hikari}
				#other{santa,bear}

			#-d "emotion=sadness" \
				#emotion{happiness,anger,sadness}(showはemotionなし)

			#-d "emotion_level=4" \
				#1~4

		aplay asdfghjkl123456789.wav
		rm -rf asdfghjkl123456789.wav
fi

exit 0
