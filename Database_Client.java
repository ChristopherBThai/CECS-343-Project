import java.sql.*;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

/* This portion is used to set up the Database Client. User will be asked
	to present his/her Username and Password to connect to the Database.
*/
public class Database_Client {
    static String USER;
    static String PASS;
    static String DBNAME;
    static String displayFormat="%-15s\n";
    static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    static String DB_URL = "jdbc:derby://localhost:1527/";
 static String dispNull (String input) {
        //because of short circuiting, if it's null, it never checks the length.
        if (input == null || input.length() == 0)
            return "N/A";
        else
            return input;
    }

    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        Scanner in1 = new Scanner(System.in);
        
        System.out.print("Name of the database (not the user account): ");
        //DBNAME = "Java DataBase Project";
        DBNAME = in.nextLine();
        System.out.print("Database user name: ");
        //USER = "Aingty";
        USER = in.nextLine();
        System.out.print("Database password: ");
        //PASS = "12345";
        PASS = in.nextLine();
        DB_URL = DB_URL + DBNAME + ";user="+ USER + ";password=" + PASS;
        Connection conn = null; 
        Statement stmt = null;  
        PreparedStatement preStmt = null;       
        String userMenuChoice;
        int userInnerChoice = 0;
        ArrayList<String> myArray;
        ArrayList<String> myArray1; // This is only used for selecting from 2 primary keys of book
        String sql;
        boolean keepGoing = true;
        try {
            //STEP 2: Register JDBC driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL);
            System.out.println("Database Connected");
            
            while (keepGoing)
            {
            	System.out.println("Please choose what to do");
            	System.out.println("     1. List all Writing Group");
            	System.out.println("     2. List all Data of a Group (User's input required)");
            	System.out.println("     3. List all Publishers");
            	System.out.println("     4. List all Data of a Publisher (User's input required)");
            	System.out.println("     5. List all Book Titles (Titles Only)");
            	System.out.println("     6. List all Data of a Book (User's input required)");
            	System.out.println("     7. Insert a new Book");
                System.out.println("     8. Insert a new Publisher (Followed by a replacing of an old Publisher)");
                System.out.println("     9. Remove a Book");
                System.out.println("    10. Exit");
                userMenuChoice = in.nextLine();
                
                //While loop to check user's valid input
                while(!(userMenuChoice.equals("1") | userMenuChoice.equals("2") | userMenuChoice.equals("3") | userMenuChoice.equals("4") | userMenuChoice.equals("5") | userMenuChoice.equals("6") | userMenuChoice.equals("7") | userMenuChoice.equals("8") | userMenuChoice.equals("9") | userMenuChoice.equals("10")))
                {
                	System.out.println("Your input is invalid, please choose a valid input from 1-10.");
                	userMenuChoice = in.nextLine();
                }
                
                //If user picked to list all Writing Group
                if (userMenuChoice.equals("1"))
                {
                	stmt = conn.createStatement();
                    sql = "SELECT * FROM writinggroup ORDER BY groupName ASC";
                    ResultSet rs = stmt.executeQuery(sql);
                    displayFormat = "%-25s%-25s%-25s%-25s\n";
                    System.out.printf(displayFormat, "GroupName:", "HeadWriter:", "YearFormed:", "Subject:");
                                        
                    while (rs.next())
                    {
                    	String groupName = rs.getString("GroupName");
                    	String headWriter = rs.getString("HeadWriter");
                    	String yearFormed = rs.getString("YearFormed");
                    	String subject = rs.getString("Subject");
                    	
                    	
                    	System.out.printf(displayFormat, dispNull(groupName), dispNull(headWriter), dispNull(yearFormed), dispNull(subject));
                    }
                    System.out.println("");
                }
                
                //If user picked to List all data for a group
                if (userMenuChoice.equals("2"))
                {
                	stmt = conn.createStatement();
                    sql = "SELECT distinct groupName FROM writinggroup ORDER BY groupName ASC";
                    ResultSet rs = stmt.executeQuery(sql);
                    System.out.print("   "); //Print this 3 spaces for indenting when numbering
                    displayFormat = "%-25s\n";
                    System.out.printf(displayFormat, "GroupName:");
                    
                    // Instantiating Array and User's internal option
                    myArray = new ArrayList<String>();
                    userInnerChoice = 0;
                    
                    int i = 1; //Used for numbering
                                        
                    while (rs.next())
                    {
                    	String groupName = rs.getString("GroupName");                    	
                    	
                    	myArray.add(groupName);
                    	
                    	System.out.print(i+". ");
                    	System.out.printf(displayFormat, dispNull(groupName));
                    	i++;
                    }
                    System.out.println("");
                    if (myArray.size() == 0)
                	{
                		System.out.println("There are no Writing Groups in the Database. Back to Main Menu.");
                	}
                	else
                	{
                		//Validating User's input for the book to be listed
                        while (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        {
                        	System.out.println("Please Choose the Writing Group to be listed: (1-"+myArray.size()+")");
                        	try{
                        		userInnerChoice = in1.nextInt();
                        	}catch (InputMismatchException e){
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        		in1.next();
                        		continue;
                        	}
                        	if (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        	{
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        	}
                        	else
                        	{
                        		break;
                        	}
                        }
                        sql = "SELECT * FROM writinggroup WHERE groupName=?";
                        preStmt = conn.prepareStatement(sql);
                        preStmt.setString(1, myArray.get(userInnerChoice-1));
                        rs = preStmt.executeQuery();
                        System.out.println("Retriving the group \""+myArray.get(userInnerChoice-1)+"\" Data.\n");
          
                        displayFormat = "%-25s%-25s%-25s%-25s\n";
                        System.out.printf(displayFormat, "GroupName:", "HeadWriter:", "YearFormed:", "Subject:");
                        
                        while (rs.next())
                        {
                        	String groupName = rs.getString("GroupName");
                        	String headWriter = rs.getString("HeadWriter");
                        	String yearFormed = rs.getString("YearFormed");
                        	String subject = rs.getString("Subject");

                        	System.out.printf(displayFormat, dispNull(groupName), dispNull(headWriter), dispNull(yearFormed), dispNull(subject));
                        }
                	}
                    System.out.println("");
                }
                
                //If user picked to list all Publisher
                if (userMenuChoice.equals("3"))
                {
                	stmt = conn.createStatement();
                	sql = "SELECT * FROM publishers ORDER BY publishername ASC";
                	ResultSet rs = stmt.executeQuery(sql);
                    displayFormat = "%-25s%-25s%-25s%-25s\n";
                    System.out.printf(displayFormat, "PublisherName:","PublisherAddress:", "PublisherPhone:", "PublisherEmail:");
                    
                    while (rs.next())
                    {
                    	String pubName = rs.getString("PublisherName");
                    	String pubAddress = rs.getString("PublisherAddress");
                    	String pubPhone = rs.getString("PublisherPhone");
                    	String pubEmail = rs.getString("PublisherEmail");
                    	
                    	System.out.printf(displayFormat, dispNull(pubName), dispNull(pubAddress), dispNull(pubPhone), dispNull(pubEmail));
                    } 
                	System.out.println("");
                }
                
                //If user picked to list all data of a Publisher
                if (userMenuChoice.equals("4"))
                {
                	stmt = conn.createStatement();
                    sql = "SELECT distinct publishername FROM publishers ORDER BY publishername ASC";
                    ResultSet rs = stmt.executeQuery(sql);
                    System.out.print("   "); //Print this 3 spaces for indenting when numbering
                    displayFormat = "%-25s\n";
                    System.out.printf(displayFormat, "PublisherName:");
                    
                    // Instantiating Array and User's internal option
                    myArray = new ArrayList<String>();
                    userInnerChoice = 0;
                    
                    int i = 1; //Used for numbering
                                        
                    while (rs.next())
                    {
                    	String pubName = rs.getString("PublisherName");                    	
                    	
                    	myArray.add(pubName);
                    	
                    	System.out.print(i+". ");
                    	System.out.printf(displayFormat, dispNull(pubName));
                    	i++;
                    }
                    System.out.println("");
                    if (myArray.size() == 0)
                	{
                		System.out.println("There are no Publishers in the Database. Back to Main Menu.");
                	}
                	else
                	{
                		//Validating User's input for the book to be listed
                        while (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        {
                        	System.out.println("Please Choose the Publishers to be listed: (1-"+myArray.size()+")");
                        	try{
                        		userInnerChoice = in1.nextInt();
                        	}catch (InputMismatchException e){
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        		in1.next();
                        		continue;
                        	}
                        	if (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        	{
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        	}
                        	else
                        	{
                        		break;
                        	}
                        }
                        sql = "SELECT * FROM publishers WHERE publishername=?";
                        preStmt = conn.prepareStatement(sql);
                        preStmt.setString(1, myArray.get(userInnerChoice-1));
                        rs = preStmt.executeQuery();
                        System.out.println("Retriving the Publisher \""+myArray.get(userInnerChoice-1)+"\" Data.\n");
          
                        displayFormat = "%-25s%-25s%-25s%-25s\n";
                        System.out.printf(displayFormat, "PublisherName:", "PublisherAddress:", "PublisherPhone:", "PublisherEmail:");
                        
                        while (rs.next())
                        {
                        	String pubName = rs.getString("PublisherName");
                        	String pubAddress = rs.getString("PublisherAddress");
                        	String pubPhone = rs.getString("PublisherPhone");
                        	String pubEmail = rs.getString("PublisherEmail");

                        	System.out.printf(displayFormat, dispNull(pubName), dispNull(pubAddress), dispNull(pubPhone), dispNull(pubEmail));
                        }
                	}         	
                	System.out.println("");
                }
                
                //If user picked to list all book titles
                if (userMenuChoice.equals("5"))
                {
                	stmt = conn.createStatement();
                	sql = "SELECT booktitle FROM book ORDER BY booktitle ASC";
                	ResultSet rs = stmt.executeQuery(sql);
                	displayFormat = "%-25s\n";
                	System.out.printf(displayFormat, "BookTitle:");
                	
                	while (rs.next())
                    {
                    	String bookTitle = rs.getString("BookTitle");
                    	
                    	System.out.printf(displayFormat, dispNull(bookTitle));
                    }
                	
                	System.out.println("");
                }
                //If user picked to List a book
                if (userMenuChoice.equals("6"))
                {
                	stmt = conn.createStatement();
                    sql = "SELECT * FROM book ORDER BY bookTitle ASC";
                    ResultSet rs = stmt.executeQuery(sql);
                    System.out.print("   "); //Print this 3 spaces for indenting when numbering
                    displayFormat = "%-25s%-25s\n";
                    System.out.printf(displayFormat, "GroupName:","BookTitle:");
                    
                    // Instantiating Array and User's internal option
                    myArray = new ArrayList<String>();
                    myArray1 = new ArrayList<String>();
                    userInnerChoice = 0;
                    
                    int i = 1; //Used for numbering
                                       
                    while (rs.next())
                    {
                    	String bookGroupName = rs.getString("GroupName");
                    	String bookTitle = rs.getString("BookTitle");
                    	
                    	myArray1.add(bookGroupName);
                    	myArray.add(bookTitle);
                    	
                    	System.out.print(i+". ");
                    	System.out.printf(displayFormat, dispNull(bookGroupName), dispNull(bookTitle));
                    	i++;
                    }
                    if (myArray.size() == 0)
                	{
                		System.out.println("There are no books in the Database. Back to Main Menu.");
                	}
                	else
                	{
                		//Validating User's input for the book to be listed
                        while (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        {
                        	System.out.println("Please Choose the book to be listed: (1-"+myArray.size()+")");
                        	try{
                        		userInnerChoice = in1.nextInt();
                        	}catch (InputMismatchException e){
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        		in1.next();
                        		continue;
                        	}
                        	if (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        	{
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        	}
                        	else
                        	{
                        		break;
                        	}
                        }
                        sql = "SELECT * FROM book WHERE groupName=? and bookTitle=?";
                        preStmt = conn.prepareStatement(sql);
                        preStmt.setString(1, myArray1.get(userInnerChoice-1));
                        preStmt.setString(2, myArray.get(userInnerChoice-1));
                        rs = preStmt.executeQuery();
                        System.out.println("Retriving the book \""+myArray.get(userInnerChoice-1)+"\", by "+myArray1.get(userInnerChoice-1)+", Data.\n");
          
                        displayFormat = "%-25s%-25s%-25s%-25s%-25s\n";
                        System.out.printf(displayFormat, "GroupName:", "BookTitle:", "PublisherName:", "YearPublished:", "NumberPages:");
                        
                        while (rs.next())
                        {
                        	String bookGroupName = rs.getString("GroupName");
                        	String bookTitle = rs.getString("BookTitle");
                        	String bookPublisherName = rs.getString("PublisherName");
                        	String bookYearPublished = rs.getString("YearPublished");
                        	String bookNumberPages = rs.getString("NumberPages");

                        	System.out.printf(displayFormat, dispNull(bookGroupName), dispNull(bookTitle), dispNull(bookPublisherName), dispNull(bookYearPublished), dispNull(bookNumberPages));
                        }
                        
                	}
                    System.out.println("");
                }
                //If user picked to Insert a new Book
                if (userMenuChoice.equals("7"))
                {
                	boolean foreignKeyConstraint = true;
                	while (foreignKeyConstraint)
                	{
                		System.out.print("Please input the new Book Group Name: ");
                    	String bookName = in.nextLine();
                    	System.out.print("Please input the new Book Title: ");
                    	String bookTitle = in.nextLine();
                    	System.out.print("Please input the new Book Publisher Name: ");
                    	String bookPubName = in.nextLine();
                    	System.out.print("Please input the new Book Year Published: ");
                    	String bookYearPub = in.nextLine();
                    	System.out.print("Please input the new Book Number of Pages: ");
                    	String bookNumPage = in.nextLine();
                    	
                    	System.out.println("Inputting the new Book, \""+bookTitle+"\" into the Database.");
                    	sql = "INSERT INTO book VALUES (?,?,?,?,?)";
                    	preStmt = conn.prepareStatement(sql);
                    	preStmt.setString(1, bookName);
                    	preStmt.setString(2, bookTitle);
                    	preStmt.setString(3, bookPubName);
                    	preStmt.setString(4, bookYearPub);
                    	preStmt.setString(5, bookNumPage);
                    	//Try-Catch in the case of foreign keys violation
                    	try{
                    		preStmt.executeUpdate();
                    		break;
                    	}catch (org.apache.derby.shared.common.error.DerbySQLIntegrityConstraintViolationException e){
                    		System.out.println("Violation of Foreign Key, Please input the Book again.");
                    	}
                	}     	
                }
                //If user picked to Insert a new Publisher
                if (userMenuChoice.equals("8"))
                {
                	System.out.print("Please input the Publisher's Name: ");
                	String pubName = in.nextLine();
                	System.out.print("Please input the Publisher's Address: ");
                	String pubAddress = in.nextLine();
                	System.out.print("Please input the Publisher's Phone: ");
                	String pubPhone = in.nextLine();
                	System.out.print("Please input the Publisher's Email: ");
                	String pubEmail = in.nextLine();
                	
                	System.out.println("Inputting the new Publisher, \""+pubName+"\" into the Database.");
                	sql = "INSERT INTO publishers VALUES (?,?,?,?)";
                	preStmt = conn.prepareStatement(sql);
                	preStmt.setString(1, pubName);
                	preStmt.setString(2, pubAddress);
                	preStmt.setString(3, pubPhone);
                	preStmt.setString(4, pubEmail);
                	preStmt.executeUpdate();
                	
                	System.out.println("Please choose an old publisher to replace the new one: ");
                	stmt = conn.createStatement();
                    sql = "SELECT distinct * FROM publishers ORDER BY publisherName ASC";
                    ResultSet rs = stmt.executeQuery(sql);
                    System.out.print("   "); //Print this 3 spaces for indenting when numbering
                    displayFormat = "%-25s%-25s%-25s%-25s\n";
                    System.out.printf(displayFormat, "PublisherName:", "PublisherAddress:","PublisherPhone:","PublisherEmail:");
                    
                    // Instantiating Array and User's internal option
                    myArray = new ArrayList<String>();
                    userInnerChoice = 0;
                    
                    int i = 1; //Used for numbering
                    
                    while (rs.next())
                    {
                    	String publisherName = rs.getString("PublisherName");
                    	String publisherAddress = rs.getString("publisheraddress");
                    	String publisherPhone = rs.getString("PublisherPhone");
                    	String publisherEmail = rs.getString("PublisherEmail");
                    	
                    	
                    	myArray.add(publisherName);
                    	
                    	
                    	System.out.print(i+". ");
                    	System.out.printf(displayFormat, dispNull(publisherName), dispNull(publisherAddress), dispNull(publisherPhone), dispNull(publisherEmail));
                    	i++;
                    }
                    System.out.println("");
                    if (myArray.size() == 0)
                	{
                		System.out.println("There are no Publisher in the Database. Back to Main Menu.");
                	}
                	else
                	{
                		//Validating User's input for the book to be removed
                        while (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        {
                        	System.out.println("Please Choose the Publisher to be replaced: (1-"+myArray.size()+")");
                        	try{
                        		userInnerChoice = in1.nextInt();
                        	}catch (InputMismatchException e){
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        		in1.next();
                        		continue;
                        	}
                        	if (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        	{
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        	}
                        	else
                        	{
                        		break;
                        	}
                        }
                	}
                    
                	//Updating books to the new Publisher
                	System.out.println("Updating books from an old Publisher to the new Publisher");
                	sql = "UPDATE book SET publishername=? WHERE publishername=?";
                	preStmt = conn.prepareStatement(sql);
                	preStmt.setString(1, pubName);
                	preStmt.setString(2, myArray.get(userInnerChoice-1));
                	preStmt.executeUpdate();
                }
                
                //If user picked to remove a book
                if (userMenuChoice.equals("9"))
                {
                	stmt = conn.createStatement();
                    sql = "SELECT * FROM book ORDER BY bookTitle ASC";
                    ResultSet rs = stmt.executeQuery(sql);
                    System.out.print("   "); //Print this 3 spaces for indenting when numbering
                    displayFormat = "%-25s%-25s%-25s%-25s%-25s\n";
                    System.out.printf(displayFormat, "GroupName:", "BookTitle:", "PublisherName:", "YearPublished:", "NumberPages:");
                    
                    // Instantiating Array and User's internal option
                    myArray = new ArrayList<String>();
                    userInnerChoice = 0;
                    
                    int i = 1; //Used for numbering
                    
                    while (rs.next())
                    {
                    	String bookGroupName = rs.getString("GroupName");
                    	String bookTitle = rs.getString("BookTitle");
                    	String bookPublisherName = rs.getString("PublisherName");
                    	String bookYearPublished = rs.getString("YearPublished");
                    	String bookNumberPages = rs.getString("NumberPages");
                    	
                    	myArray.add(bookTitle);
                    	
                    	
                    	System.out.print(i+". ");
                    	System.out.printf(displayFormat, dispNull(bookGroupName), dispNull(bookTitle), dispNull(bookPublisherName), dispNull(bookYearPublished), dispNull(bookNumberPages));
                    	i++;
                    }
                    System.out.println("");
                	if (myArray.size() == 0)
                	{
                		System.out.println("There are no books in the Database. Back to Main Menu.");
                	}
                	else
                	{
                		//Validating User's input for the book to be removed
                        while (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        {
                        	System.out.println("Please Choose the book to be removed: (1-"+myArray.size()+")");
                        	try{
                        		userInnerChoice = in1.nextInt();
                        	}catch (InputMismatchException e){
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        		in1.next();
                        		continue;
                        	}
                        	if (userInnerChoice <= 0 || userInnerChoice > myArray.size())
                        	{
                            	System.out.println("Sorry, invalid input. Please choose a number between 1 and "+ myArray.size()+".");
                        	}
                        	else
                        	{
                        		break;
                        	}
                        }
                        System.out.println("Deleting \""+myArray.get(userInnerChoice-1)+"\" from the Database.");
                        sql = "DELETE FROM book WHERE bookTitle=?";
                        preStmt = conn.prepareStatement(sql);
                        preStmt.setString(1, myArray.get(userInnerChoice-1));
                        preStmt.executeUpdate();
                        System.out.println("Successfully Deleted \""+myArray.get(userInnerChoice-1)+"\" from the Database.");
                	}                    
                }
                //If user's input is to Exit
                if (userMenuChoice.equals("10"))
                {
                	keepGoing = false;
                }
            } 
        } catch (SQLException se) {
        	//Handle errors for JDBC
        	System.out.println("Connection Refused. Please make sure Database is connected.");
        	se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
        	System.out.println("No class for SQL, Returning to Menu.");
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
            }// nothing we can do
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        System.out.println("Goodbye!");
    }//end main
}//end FirstExample}
