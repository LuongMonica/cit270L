function Get-Soup ([switch] $please, [string] $soup="chicken noodle")
{
  if ($please) {
    "Here's your $soup soup"
  }
  else {
    "No soup for you!"
  }
}
Get-Soup -please "tomato bisque"