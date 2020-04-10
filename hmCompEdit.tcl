

proc comp_edit {type} {
	if {[string equal $type "front"]} {
		*createmarkpanel comps 1 "select the comps"
		set compsId [hm_getmark comps 1]
		if {$compsId == []} { return [] }
		set str [hm_getstring "front=" "input string"]
		foreach compId $compsId {
			set compName [hm_entityinfo name comps $compId]
			set fullStr "$str $compName"
			set fullStr [join $fullStr "_"]
			*renamecollector components "$compName" "$fullStr"
		 } 
	}
	if {[string equal $type "rear"]} {
		*createmarkpanel comps 1 "select the comps"
		set compsId [hm_getmark comps 1]
		if {$compsId == []} { return [] }
		set str [hm_getstring "rear=" "input string"]
		foreach compId $compsId {
			set compName [hm_entityinfo name comps $compId]
			set fullStr "$compName $str"
			set fullStr [join $fullStr "_"]
			*renamecollector components "$compName" "$fullStr"
		 } 
	}
	if {[string equal $type "replace"]} {
		*createmarkpanel comps 1 "select the comps"
		set compsId [hm_getmark comps 1]
		if {$compsId == []} { return [] }
		set inputStr [hm_getstring "oldString newString=" "input string"]
		set oldString [lindex $inputStr 0]
		set newString [lindex $inputStr 1]
		

		foreach compId $compsId {
			set compName [hm_entityinfo name comps $compId]
			set fullStr [string map "$oldString $newString" $compName]
			*renamecollector components "$compName" "$fullStr"
		 } 
	}

	if {[string equal $type "help"]} {
		puts "compEdit front"
		puts "compEdit rear"
		puts "compEdit replace"
	}
	# 指定替换字符
	# 增加前缀
	# 增加后缀

}


