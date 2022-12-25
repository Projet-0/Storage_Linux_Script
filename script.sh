#!/bin/bash


path='/home/mohamed/Bureau/'
file_path='/home/mohamed/Bureau/SFTP/README.md'


# On va simplifier les commandes avec du -sh * | sort -n | awk '{print $1}'

#test if the path is a file or a folder 

file_or_directory () {
	if [[ -f $1 ]]
	then
	    echo "$1 this is a file in the system."
	elif [[ -d $1 ]]
	then
	    echo "$1 this is a directory."
	else
	    echo "the type or the file is not good"

	fi


}
#file_or_directory $file_path ;




#test get all the file in an array and display their size

get_all () {
	test= `du -sh * | sort -n | awk 'NR==1{print $1}' ` ;
	count=0 ; 

	#myarray=`ls -Aa` ;

	myarray=`du -sh * | sort -n`
	myarray_size=("result") ;

	
	for str in ${myarray[@]}; do
		if [[ -f $str ]]
		then
		    myarray_size[${#myarray_size[@]}]=`du -sh $str` 
		    echo "The size of the file is:`du -sh $str` "
		    echo "--------------------------------------"
		elif [[ -d $str ]]
		then
		    myarray_size[${#myarray_size[@]}]=`du -sh $str` 
		    echo "The size of the folder is:`du -sh $str` "
		    echo "--------------------------------------"
		else 
		    myarray_size[${#myarray_size[@]}]=`du -sh $str` 
		    echo "The type is not recognize:`du -sh $str` "
		    echo "--------------------------------------"
		fi
	done

	for str in ${myarray_size[@]}; do
	    echo $str
	done

	for new in ${test[@]}; do
	    echo " value of the $new"
	done
}

get_all 


#Display the size of a folder
size_folder () {
  variable="du -sh $1" ;
  $variable ;
}

#count number of folder
display_folder () {
	ls -a $1| sed 's/[^,]//g' | wc -c 
}


# realise a loop
loop() {
	for i in $(seq 1 $1)
	do
	
    		echo "iteration de la boucle" ;
	done
}

#count number of parameters
number () {
	echo $# ; 
}


loop $# ;



parameter () {
	while getopts "d:h:s:r:f:a:o:" OPT; do


	case "${OPT}" in
	d)
	    d_p=${OPTARG};
	    display_folder $d_p; 
            ;;	
	h)
	    h_p=${OPTARG};
	    display_folder $h_p; 
            ;;	
        s)
            s_p=${OPTARG} ;;
	r)
            r_p=${OPTARG};;
	f)
            f_p=${OPTARG};;
	a)
            a_p=${OPTARG};;
	o)
            o_p=${OPTARG};;
		
        *)
            fourth="Error: ${OPT} is not acceptable";;

    	esac
	done

	echo "Value of d  is : $d_p,  Value of h is : $second, Value of s is : $third, $fourth"
}


parameter -d $path ;


# du -ckh  pour afficher la taille de tous les sous dossiers/fichiers directs 
# du -cksh pour afficher la taille des sous dossier non cachées