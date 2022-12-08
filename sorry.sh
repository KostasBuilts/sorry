echo "Did I eat your souvlaki (y/n):"
read svlkEaten
if [ $svlkEaten == "Y" ] || [ $svlkEaten == "y" ]
then
        echo "I am terribly sorry"
elif [ $svlkEaten == "N" ] || [ $svlkEaten == "n" ]
then
        echo "OK"
fi
