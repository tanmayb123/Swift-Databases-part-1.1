This "auxiliary code" (called by apple) helps with reading JSON from online.
  
To use:  
  
1.  Download and use "TBSDB.swift" file in your project  
2.  Use the code "request = TBSDB(initWithURL: <YOUR LINK>)" to create the request  
3.  Use the code "request.getData()" to get the NSData value  
4.  Use the code "request.dictionaryValue()" to get the Dictionary value  
5.  Use the code "request.arrayValue()" to get the Array value  
