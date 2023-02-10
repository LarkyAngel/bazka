echo podaj username:
read username
echo podaj hasło:
read password

export PGPASSWORD="$password"

FILE=/skijumping/Main.class
if ! [[ -f "$FILE" ]]; then
	psql -h lkdb -d mrbd -U $username -f tabele.sql
	javac --release 8 -cp ".:postgresql-42.5.3.jar" skijumping/*.java
fi

java -cp ".:postgresql-42.5.3.jar" skijumping.Main $username $password