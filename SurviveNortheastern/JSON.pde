ArrayList<String> StringsToArrayList(JSONArray strings) {
  ArrayList<String> result = new ArrayList<String>();
  int index = 0;
  while(!strings.isNull(index)) {
    result.add(strings.getString(index)); 
    index++;
  } 
  
  return result;
}

ArrayList<Integer> NumbersToArrayList(JSONArray numbers) {
  ArrayList<Integer> result = new ArrayList<Integer>();
  int index = 0;
  while(!numbers.isNull(index)) {
    result.add(numbers.getInt(index)); 
    index++;
  } 
  
  return result;
}