while :
do	
	cat t1 > tt
	#echo "CPU_FREE=45;" >> tt
	#echo "CPU_USED=55;" >> tt
	#echo "MEM_FREE=1123212;" >> tt
	#echo "MEM_USED=1562464;" >> tt
	#echo "DSK_FREE=1231244;" >> tt
	#echo "DSK_USED=123232;" >> tt
	sar 1 1 |grep Average |awk '{print "CPU_FREE=" $8 ";\nCPU_USED=" 100-$8";"}' >> tt
	#echo "CPU_FREE=45;" >> tt
	#echo "CPU_USED=55;" >> tt
	free|grep Mem | awk '{print "MEM_FREE=" $4 ";\nMEM_USED=" $3 ";"}' >> tt
	df -k |grep -v Filesystem |awk '{sum += $4} END {print "DSK_FREE=" sum ";"}' >> tt
	df -k |grep -v Filesystem |awk '{sum += $3} END {print "DSK_USED=" sum ";"}' >> tt
	#echo "MEM_FREE=1123212;" >> tt
	#echo "MEM_USED=1562464;" >> tt
	#echo "DSK_FREE=1231244;" >> tt
	#echo "DSK_USED=123232;" >> tt
	cat t2 >> tt
	cp tt /var/www/html/serverstatus2.html
done

