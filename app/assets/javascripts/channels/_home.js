function showAppropriateForm( v )
{
  document.getElementById( "Form1" ).style.visibility = "hidden";
  document.getElementById( "Form2" ).style.visibility = "hidden";
  if( v == "Model 1" )
  {
    document.getElementById( "Form1" ).style.visibility = "visible";
  }
  else if( v == "Model 2" )
  {
    document.getElementById( "Form2" ).style.visibility = "visible";
  }
}
