# Start the MariaDB server with the --skip-networking option so it doesn't accept connections
mysqld_safe --skip-networking &

# Wait for the MariaDB server to start
sleep 10

# Change the root password
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Create the database and user
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#mysql -e "DROP USER IF EXISTS ''@'localhost';"

# Flush the privileges and shutdown the MariaDB server
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start the MariaDB server normally
exec mysqld_safe

