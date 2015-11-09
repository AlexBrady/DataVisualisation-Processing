
ArrayList<String> countries = new ArrayList<String>(); // Create an arraylist
ArrayList<Float> users_per_year = new ArrayList<Float>(); // Create an arraylist
ArrayList<Float> years = new ArrayList<Float>();

int num_years;

void setup()
{
  size(500,500);
  background(0);
  
  num_years = 0;
    
  readCountries();
  readUsers();
  readYears();
 
}


void draw()
{
}


void readCountries()
{
    String[] countryData = loadStrings("country_list.txt"); // Load the countries into a String array

    for( int i = 0; i < countryData.length; i ++ )
    {
    
    String temp = countryData[i];
    
    for( String s:temp.split(" ") )
    {
        countries.add(s);
    }//end inner for
  }//end outer for
  
 for( int i = 0; i < countryData.length; i ++ )
 {
   println("Country : "+countries.get(i));
 }//end for
 
}//end readCountries()

void readUsers()
{
  String[] userData = loadStrings("users_per_year.txt"); // Load the users into a String array
  
  for( int i = 0; i < userData.length; i ++ )
  {
    String temp = userData[i];

    for(String s:temp.split(","))
    {
      float f = Float.parseFloat(s);
      users_per_year.add(f);
    }
  }
  
  for( int i = 0; i < userData.length; i ++ )
 {
   println("Data : "+users_per_year.get(i));
 }//end for
 
}//end readUsers()

void readYears()
{
  String[] yearData = loadStrings("years.txt"); // Load the years into a String array
  
  for( int i = 0; i < yearData.length; i ++ )
  {
    String temp = yearData[i];

    for(String s:temp.split(","))
    {
      float f = Float.parseFloat(s);
      years.add(f);
    }
  }
  
  for( int i = 0; i < yearData.length; i ++ )
 {
   println("Year : "+years.get(i));
 }//end for
 
}//end readYears()

