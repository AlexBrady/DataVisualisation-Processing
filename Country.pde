// Class to store country and user data to be accessed easily to determine the selected  country and data
class Country 
{
  
  String name;
  float[] years = new float[4];

  Country(String line)
  {
    
    String[] parts = line.split(",");
    name = parts[0];
    years[0] = Float.parseFloat(parts[1]);
    years[1] = Float.parseFloat(parts[2]);
    years[2] = Float.parseFloat(parts[3]);
    years[3] = Float.parseFloat(parts[4]);
  }
  
}// end Country class
