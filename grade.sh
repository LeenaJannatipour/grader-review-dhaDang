CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission 
#$1 takes first argument and clones 
echo 'Finished cloning'

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

if [[ -f student-submission/ListExamples.java ]]
    then 
    echo "ListExamples.java found"
    else  
    echo "ListExamples.java not found"
    echo "Score:0/4"
    exit
fi

cp student-submission/ListExamples.java grading-area
cp TestListExamples.java grading-area

cp -r lib grading-area #copying recursively and everything in library folder to grading area 

#take out cd grading-area because already below

javac -cp $CPATH grading-area/*.java 
#reroute JUnit test output to output.txt file
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples > output.txt








# Then, add here code to compile and run, and do any post-processing of the
# tests
