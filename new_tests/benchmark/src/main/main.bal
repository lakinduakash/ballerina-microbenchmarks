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

http:ClientConfiguration clientConfig = {
    httpVersion: "2.0"
};

http:Client nettyEP = new("http://35.184.45.101:80", clientConfig);

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

	resource function cpudb(http:Caller caller, http:Request request) returns error? {

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

		var id = <string>params.get("id")[0];//<string>params.id
		var query = "SELECT * FROM emp where id = "+id;

		stream<record{}, error> resultStream = mysqlClient4->query(<@untainted>query);

		record {|record {} value;|}|error? result = resultStream.next();

    	error? e = resultStream.close();


		response.setTextPayload(<@untainted> io:sprintf("%b", is_prime));
		check caller->respond(response);

	}

	resource function dbcpu(http:Caller caller, http:Request request) returns error? {

		http:Response response = new;
		var params = request.getQueryParams();

		var id = <string>params.get("id")[0];//<string>params.id
		var query = "SELECT * FROM emp where id = "+id;

		stream<record{}, error> resultStream = mysqlClient4->query(<@untainted>query);

		record {|record {} value;|}|error? result = resultStream.next();

    	error? e = resultStream.close();


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

	resource function loopdb(http:Caller caller, http:Request request) returns error? {

		http:Response response = new;
		var params = request.getQueryParams();

		var id = <string>params.get("id")[0];//<string>params.id
		var query = "SELECT * FROM emp where id = "+id;

		int number=check ints:fromString(params.get("number")[0]);

		record {|record {} value;|}|error? result;

		foreach var i in 0...(number){
			stream<record{}, error> resultStream = mysqlClient4->query(<@untainted>query);

			result = resultStream.next();

    		error? e = resultStream.close();
		}

		response.setTextPayload(<@untainted> io:sprintf("%s", result));
		check caller->respond(response);
	}

	resource function echoget(http:Caller caller, http:Request request) returns error? {

		http:Request req = new;
    	req.addHeader("X-ECHO-CODE", "200");


    	var response = nettyEP->get("/get", req);

    	if (response is http:Response) {
			string contentType = response.getHeader("Content-Type");
			int statusCode = response.statusCode;

			check caller->respond(response);
			
		} else {
			io:println("Error when calling the backend: ",
			response.detail()?.message);

			http:Response res = new;
            res.statusCode = 500;
            res.setPayload(response.detail()?.message);
            var result = caller->respond(res);
			
			check caller->respond(res);
		}
		
	}

	resource function passthrough(http:Caller caller, http:Request request) returns error? {

		
    	request.addHeader("X-ECHO-CODE", "200");


    	var response = nettyEP->forward("/forward",request);

    	if (response is http:Response) {
			string contentType = response.getHeader("Content-Type");
			//io:println("Content-Type: " + contentType);

			int statusCode = response.statusCode;
			//io:println("Status code: " + statusCode.toString());

			check caller->respond(response);

		} else {

			http:Response res = new;
            res.statusCode = 500;
            res.setPayload(response.detail()?.message);
            var result = caller->respond(res);
			
			check caller->respond(res);
		}
		
	}

	resource function echogetdb(http:Caller caller, http:Request request) returns error? {

		http:Request req = new;
    	req.addHeader("X-ECHO-CODE", "200");


    	var response = nettyEP->get("/get", req) ;

		var params = request.getQueryParams();
		var id = <string>params.get("id")[0];//<string>params.id
		var query = "SELECT * FROM emp where id = "+id;

		stream<record{}, error> resultStream = mysqlClient4->query(<@untainted>query);

		record {|record {} value;|}|error? result = resultStream.next();

		error? e = resultStream.close();
		
		if (response is http:Response) {
			response.setTextPayload(<@untainted> io:sprintf("%s", result));
		}


    	if (response is http:Response) {
			string contentType = response.getHeader("Content-Type");
			int statusCode = response.statusCode;

			check caller->respond(response);
			
		} else {
			io:println("Error when calling the backend: ",
			response.detail()?.message);

			http:Response res = new;
            res.statusCode = 500;
            res.setPayload(response.detail()?.message);

            check caller->respond(res);
		}
		
	}


	resource function echogetcpu(http:Caller caller, http:Request request) returns error? {

		http:Request req = new;
    	req.addHeader("X-ECHO-CODE", "200");


    	var response = nettyEP->get("/get", req);


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


    	if (response is http:Response) {
			string contentType = response.getHeader("Content-Type");
			int statusCode = response.statusCode;

			response.setTextPayload(<@untainted> io:sprintf("%b", is_prime));
			check caller->respond(response);
			
		} else {
			io:println("Error when calling the backend: ",
			response.detail()?.message);

			http:Response res = new;
            res.statusCode = 500;
            res.setPayload(response.detail()?.message);
            var result = caller->respond(res);
			
			check caller->respond(res);
		}
		
	}

	resource function dbechoget(http:Caller caller, http:Request request) returns error? {


		var params = request.getQueryParams();
		var id = <string>params.get("id")[0];//<string>params.id
		var query = "SELECT * FROM emp where id = "+id;

		stream<record{}, error> resultStream = mysqlClient4->query(<@untainted>query);

		record {|record {} value;|}|error? result = resultStream.next();

		error? e = resultStream.close();
		

		http:Request req = new;
    	req.addHeader("X-ECHO-CODE", "200");


    	var response = nettyEP->get("/get", req) ;

		if (response is http:Response) {
			response.setTextPayload(<@untainted> io:sprintf("%s", result));
		}


    	if (response is http:Response) {
			string contentType = response.getHeader("Content-Type");
			int statusCode = response.statusCode;

			check caller->respond(response);
			
		} else {
			io:println("Error when calling the backend: ",
			response.detail()?.message);

			http:Response res = new;
            res.statusCode = 500;
            res.setPayload(response.detail()?.message);

            check caller->respond(res);
		}
		
	}
}
