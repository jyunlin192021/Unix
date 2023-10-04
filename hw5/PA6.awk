BEGIN{ DE = "Database Entry: "}
/^End of/{next}
/Ship's Database - Dilithium/{ $0 = "Database Entry: Dilithium" }
/^Deep Space Hibernation:|^Weapons System:/ {split($0,A,": ") ; DB[DE A[1]] = A[2]"\n" ; getline }
{sub ( "Log, Day 113", "Log - Mission Day 113" ) }
{sub ( ", Supplemental", " - Mission Day 113, Supplemental" ) }
/^Database|^Captain's Log/{ K = $0 ; DB[K]="" ; getline }
/^User/ { K = "" }
K != "" {DB[K] = DB[K] "\n"$0 }
END{ for (i in DB ){ print i ":" ; print DB[i] ; print "------------------------" } }
