echo "Implementing Basic Calculator"

select choice in Exit Add Sub Div Mul
do
  if [ $choice != "Exit" ]; then
    echo -n "Enter Two Numbers: "
    read num1 num2
  fi

  case $choice in
    Add) 
	  echo `expr $num1 + $num2`
	  ;;
	Sub)
	  echo `expr $num1 - $num2` 
	  ;;
	Mul)
	  echo `expr $num1 \* $num2`
	  ;;
	Div)
	  echo `expr $num1 / $num2`
	  ;;
    Exit)
	  exit
  esac
done
