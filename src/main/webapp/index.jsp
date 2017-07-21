
<%@ page import = "java.sql.*" %>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%@ page import = "org.json.simple.parser.JSONParser" %>
<%@ page import = "org.json.simple.parser.ParseException" %>


<%
JSONParser jsonParser = new JSONParser();
JSONObject jsonObject = (JSONObject)jsonParser.parse(System.getenv("VCAP_SERVICES"));
JSONArray mySqlArray = (JSONArray)jsonObject.get("mysql");
JSONObject jsonMysql = (JSONObject)mySqlArray.get(0);
JSONObject jsonCredential = (JSONObject)jsonMysql.get("credentials");

String db_hostname = (String)jsonCredential.get("hostname");
String db_port = (Long)jsonCredential.get("port")+"";
String db_name = (String)jsonCredential.get("name");
String db_username = (String)jsonCredential.get("username");
String db_password = (String)jsonCredential.get("password");

// out.println("db_hostname = "+db_hostname+" / db_port = "+db_port+" / db_name = "+db_name+" / db_username = "+db_username+" / db_password = "+ db_password);
  out.println("hello world!!!");
try{
	Connection conn = null;   
	String url = "jdbc:mysql://"+db_hostname+":"+db_port+"/"+db_name;	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url,db_username,db_password);	
	out.println("DB connected!!!");
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select * from test");
	
	while(rs.next()){
		out.print(rs.getString("name")+" / ");
		out.println(rs.getString("val"));
	}
	
	rs.close();
	stmt.close();
	
	
}catch(Exception e){
	e.printStackTrace();
	System.out.println(e);
}
%>