import ballerina/io;
import ballerina/jsonutils;
import ballerina/time;
import ballerinax/java.jdbc;
jdbc:Client testDB = new ({
    url: "jdbc:mysql://localhost:3306/testdb",
    username: "root",
    password: "test@123",
    dbOptions: {useSSL: false}
});
type Student record {
    int id;
    int age;
    string name;
    time:Time insertedTime;
};public function main() {
    io:println("The update operation - Creating a table");
    var ret = testDB->update("CREATE TABLE student(id INT AUTO_INCREMENT, " +
        "age INT, name VARCHAR(255), insertedTime TIMESTAMP DEFAULT " +
        "CURRENT_TIMESTAMP, PRIMARY KEY (id))");
    handleUpdate(ret, "Create student table");
    io:println("\nThe update operation - Inserting data to a table");
    ret = testDB->update("INSERT INTO student(age, name) values " +
                          "(23, 'john')");
    handleUpdate(ret, "Insert to student table with no parameters");
    int age = 24;
    string name = "Anne";
    ret = testDB->update("INSERT INTO student(age, name) values (?, ?)",
        age, name);
    handleUpdate(ret, "Insert to student table with variable parameters");
    jdbc:Parameter p1 = {sqlType: jdbc:TYPE_INTEGER, value: 25};
    jdbc:Parameter p2 = {sqlType: jdbc:TYPE_VARCHAR, value: "James"};
    jdbc:Parameter p3 = {
        sqlType: jdbc:TYPE_TIMESTAMP,
        value: time:currentTime()
    };
    ret = testDB->update("INSERT INTO student(age, name, insertedTime) " +
                         "values (?, ?, ?)", p1, p2, p3);
    handleUpdate(ret, "Insert to student table with jdbc:parameter values");
    io:println("\nThe Update operation - Update data in a table");
    ret = testDB->update("UPDATE student SET name = 'jane' WHERE age = ?", 23);
    handleUpdate(ret, "Update a row in student table");
    io:println("\nThe Update operation - Delete data from table");
    ret = testDB->update("DELETE FROM student WHERE age = ?", 24);
    handleUpdate(ret, "Delete a row from student table");
    io:println("\nThe Update operation - Inserting data");
    var retWithKey = testDB->update("INSERT INTO student " +
                    "(age, name) values (?, ?)", 31, "Kate");
    if (retWithKey is jdbc:UpdateResult) {
        io:println("Inserted row count: ", retWithKey.updatedRowCount);
        io:println("Generated key: ",
                    <int>retWithKey.generatedKeys["GENERATED_KEY"]);
    } else {
        io:println("Insert failed: ", <string>retWithKey.detail()?.message);
    }
    io:println("\nThe select operation - Select data from a table");
    var selectRet = testDB->select("SELECT * FROM student where age < ?",
                                    Student, 35);
    if (selectRet is table<Student>) {
        json jsonConversionRet = jsonutils:fromTable(selectRet);
        io:println("JSON: ", jsonConversionRet.toJsonString());
    } else {
        io:println("Select data from student table failed: ",
        <string>selectRet.detail()?.message);
    }
    //io:println("\nThe update operation - Drop the student table");
    //ret = testDB->update("DROP TABLE student");
    //handleUpdate(ret, "Drop table student");
}
function handleUpdate(jdbc:UpdateResult|jdbc:Error returned, string message) {
    if (returned is jdbc:UpdateResult) {
        io:println(message, " status: ", returned.updatedRowCount);
    } else {
        io:println(message, " failed: ", <string>returned.detail()?.message);
    }
}
