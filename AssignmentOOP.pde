/* Program to display users of the internet per 100 people over 4 years for 15 
different countries. User will click a country flag which will then display that
selected countries data. C14393571 Alex Brady DT228/2 OOP */

ArrayList<Country> countries = new ArrayList<Country>(15); //Add country class to an arraylist
ArrayList<Integer> years = new ArrayList<Integer>(); // add year data into an integer arraylist
//Initialise Variables

PImage[] flagImages; //Image array
int n;
boolean overBox = false;
boolean locked = false;
int selected_country;
boolean[] keys = new boolean[512];

void keyPressed()
{
  keys[keyCode] = true;
}
void keyReleased()
{
  keys[keyCode] = true;
}

void setup()
{
  size(600, 600);
  n = 15;

//Load the images into an image array( I called my images '1.jpg', '2.jpg' ect.)
  flagImages = new PImage[n];
  for ( int i = 0; i < flagImages.length; i ++ )
  {
    flagImages[i] = loadImage(str(i) + ".jpg");
  }//end for
  //Call functions to read in the data
  readUsers();
  readYears();
}


void draw()
{
  //Main Menu :
  background(0);
  fill(0, 255, 0);  
  String menuText = "Welcome !\nPress the spacebar to see a choice of countries represented by thier flags.";
  int menuTextX = width / 2;
  int menuTextY = height / 2;
  float flagSpace = width / 7;

  textSize(12);
  textAlign(CENTER);
  text(menuText, menuTextX, menuTextY); //Display the text in the menu
  
  if(keys[' '])
  {
    menuFlags(); // Call function to display menu of flags to choose from
  }
}


void readUsers() //Function to read in the countries and users
{
  
  String[] lines = loadStrings("data/country_data.csv"); 
  
  for(int i = 0; i<lines.length; i++)
  {
     countries.add(new Country(lines[i]));
  }// end for loop
  
}//end readUsers()



void readYears() // Function to read in the years(2011-2014)
{
  String[] yearData = loadStrings("years.txt"); // Load the years into a String array

  for ( int i = 0; i < yearData.length; i ++ )
  {
    String temp = yearData[i];

    for (String s : temp.split (","))
    {
      int f = Integer.parseInt(s);
      years.add(f);
    }// end inner for
  }// end outer for
}//end readYears()

void drawAxis() //Function to display the graphs
{ 
  //Initialise Variables
  float borderY = height *.10;// Borders of the graph
  float borderX = width *.10;
  int maxUsers = 100; // Max amount of users possible in the data
  float tickSize = borderX * 0.1; // Varibales for the ticks on the graph
  float tickSpace = 0;
  float tickSizeX = borderX * 0.1;
  float tickSpaceX = 0;
  String yText = "Internet Users";
  String xText = "Year";
  int Xnum = 0;
  float tempStart = tickSizeX*6;
  
  // Background image to be the flag of the selected country
  PImage bg = flagImages[selected_country];
  bg.resize(width, height);
  background(bg);
  
  line(borderX, borderY, borderX, height - borderY); // draw Y axis
  line(borderX, height - borderY, width-borderX , height - borderY); // drw X axis
    
  for(int i = 0; i < (maxUsers / 10) + 1; i ++)
  {// Label the Y axis with ticks and numbers
    line(borderX, height - borderY - tickSpace, borderX - tickSize, height - borderY - tickSpace);    
    text(Xnum, borderX - (tickSize*5), height - borderY - tickSpace);
    Xnum += 10;
    tickSpace += (height*0.8) / 10;
  }// end for()
  
  for(int j = 0; j < years.size(); j++)
    {// Label the X-axis with ticks and numbers
      line(borderX + tickSpaceX, height - borderY, borderX + tickSpaceX, height - borderY + tickSize); 
      text(years.get(j), borderX + tickSpaceX + tempStart, height - borderY + (tickSizeX*5));
      tickSpaceX += (width*0.8) / 4;
    }//end for()
    
  for(int i=0; i < 4; i++)
  {
      // Mapping the graphs
      float x1 = map(i, 0 , 4, borderX, width - borderX);
      float y1 = map(countries.get(selected_country).years[i], 0 , maxUsers , height - borderY, borderY);
      //Drawing the bars in the graph
       stroke(0,255,0);
       fill(0,127,127,170);
       rect(x1,y1,(width*.80)/4,(height-y1) - borderY);
     
  }// end inner for
  
  // Label the Y and X axis with the title of each set of data
  fill(255,255,0);
  text( yText, (width*0.1), (height*0.05) );
  text( xText, (width*0.45), (height*0.98) );
}



void menuFlags()// Function to isplay a list of flags to choose from
{
  //Initialise Variables
  background(0);
  int posX = 0;
  int posY = 0;
  int flagWidth = width / 5;
  int flagHeight = height / 3;
  
  for( int i = 0; i < flagImages.length; i ++ )
  {// for loop to display the flags, and determine whether a user has clicked on a specific flag
    if (mouseX > posX && mouseX < posX + flagWidth && 
          mouseY > posY && mouseY < posY + flagHeight)
    {
      overBox = true; 
      
      if(!locked)
      {
        if( mousePressed == true )
        {
          drawAxis(); // Call the graph
          break;
        }//end inner if
          tint(255,127); // Allows the user to see which country they have selected
          selected_country = i;
        }//end outer if 
      }//end outer outer if
      else 
      {
        tint(255,255);
        overBox = false;
      }//end else
      
      // Display the flags
      image(flagImages[i], posX, posY, flagWidth, flagHeight);
      posX += flagWidth;
      
      if( posX >= width )
      {
        posX = 0;
        posY += flagHeight;
      }//end if
    
  }// end for loop
  
  
}// end menuFlags
