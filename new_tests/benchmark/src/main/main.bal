import ballerina/http;
import ballerina/io;
import ballerina/lang.'int as ints;
import ballerina/time;
import ballerina/mysql;

string dbUser = "root";
string dbPassword = "root@123";
string database="testdb";


mysql:Client mysqlClient4 = check new ("localhost", dbUser, dbPassword,
        database, 3306);

service microbenchmark on new http:Listener(9090) {

	resource function cpu(http:Caller caller, http:Request request) returns error? {
		http:Response response = new;
		var params = request.getQueryParams();

		int number=check ints:fromString(params.get("number")[0]);
		int count = 0;

		foreach var i in 3...(number) {
			var prime = true;
		        foreach var j in 2...(i-1) {
		 	       if(i % j == 0){
					prime = false;
					break;
				}
			}
			if(prime==true){
				count = count+1;
			}
		}


		response.setTextPayload(<@untainted> io:sprintf("%s", count));
		check caller->respond(response);
	}

	resource function is_prime(http:Caller caller, http:Request request) returns error? {
		http:Response response = new;
		var params = request.getQueryParams();

		
		int number=check ints:fromString(params.get("number")[0]);
		boolean is_prime = false;

		boolean flag=false;

		foreach var i in 2...(number/2) {
				
				if (number % i) == 0{
					flag=true;
					break;
				}
			}

		if(number == 1){
			is_prime=true;
		}
		else {
        	if (!flag){
				is_prime=true;
			}
			else{
				is_prime=false;
			}
    	}


		response.setTextPayload(<@untainted> io:sprintf("%b", is_prime));
		check caller->respond(response);
	}

    resource  function mergesort(http:Caller caller, http:Request request) returns error? {

        http:Response response = new;
		var params = request.getQueryParams();
		int size=check ints:fromString(params.get("size")[0]);

        int[] sample = [];
        foreach var x in 0 ... size {
        sample[x] = size - x;
        }

        int startTime = time:currentTime().time;
        seqMergesort(sample);
        int diff = time:currentTime().time - startTime;

        response.setTextPayload(<@untainted> io:sprintf("%s milliseconds", diff.toString()));
		check caller->respond(response);
    }

	resource function db_select(http:Caller caller, http:Request request) returns error? {
		http:Response response = new;
		var params = request.getQueryParams();
		var id = <string>params.get("id")[0];//<string>params.id
		var query = "SELECT * FROM emp where id = "+id;

		stream<record{}, error> resultStream = mysqlClient4->query(<@untainted>query);

		record {|record {} value;|}|error? result = resultStream.next();

    	error? e = resultStream.close();

		response.setTextPayload(<@untainted> io:sprintf("%s", result));
		check caller->respond(response);

    	}

	resource function file(http:Caller caller, http:Request request) returns @tainted error? {
		http:Response response = new;
		var params = request.getQueryParams();
		var filename = "./files/"+<string>params.get("file")[0];
		io:ReadableByteChannel readableFieldResult = check io:openReadableFile(<@untainted> filename);
		io:ReadableCharacterChannel sourceChannel = new(readableFieldResult, "UTF-8");
		int file_size=check ints:fromString(params.get("size")[0]);
		string fileText = check sourceChannel.read(<@untainted> file_size);	
		var close_result = sourceChannel.close();	
		response.setTextPayload(<@untainted> fileText);
		check caller->respond(response);
    	}

	resource function io(http:Caller caller, http:Request request) returns error? {
		http:Response response = new;
		var params = request.getQueryParams();
		var message = <string>params.get("message")[0];
		response.setTextPayload(<@untainted> message);
		check caller->respond(response);
    	}

	resource function memory(http:Caller caller, http:Request request) returns error? {
		http:Response response = new;
		var params = request.getQueryParams();
		
		int number = check ints:fromString(params.get("number")[0]);

		int[] array = [];
		foreach var i in 0...number {
		        array[i] = i*1000;
		}
				
		response.setTextPayload(<@untainted> io:sprintf("%s", array.length()));
		check caller->respond(response);
    	}
}
