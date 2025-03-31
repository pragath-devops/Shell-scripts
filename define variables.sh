define variables

local variables

a=10
b=20
name=ram

system variable
SHELL   call to --echo $SHELL
HOME    call to --echo $HOME
SSH_CONNECTION
USER = ECHO $USER
SSH_CLIENT -PUB IP

env --check ebvironments

global variables
this is user level variables
 temporary 
  export a=100
  export b=200
 
perminent
  open user profile .bashrc and go to end add variable
  define in user profile
     vi /home/ubuntu/.bashrc  --ubuntu(debian family)
     vi /home/ubuntu/.bash_profile --redhat(fedora family)

export a=10
export name=ask

after exit/
source ~/.bashrc then reflect the perminent variables

when variable calling first preferance it will check script variables then go to perminent variables/global variables


read variable
--------------

pasing dynamically variable
#read -p "prompt string: " variable name

#read -p "enter a value: " a
echo "printing a value is $a"

passing arguments
------------------
define like this
a=$1
b=$2

calling like 

sh scriptname.sh 10 20

here script name is $0
10 value is $1
20 value is $2
like give $9 argumments
total arg $#
