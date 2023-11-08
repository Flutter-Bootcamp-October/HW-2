/*
stateful?
init state (display all function to build global weatherList: call api/ Riyadh-London-Jubail)

searchbar: 
 - textfield: "hint enter city name"/ controller
onSubmitted async{
  1. check controller.text not empty
  2. call get weather from api services
  3. check status code
  4. jsonDecode and create weateher object:
    - final decodedResponse = jsonDecode(response.body);
    - Weather.fromJson(decodedResponse);
  5. set golbal current city to Weather object
    - currentCity = Weather.fromJson(decodedResponse);
  6. push to details screen
}

ListView{ uses weatherList}:
 1. widget{ Weather object ---> weatherList[index]}
 2. no tap ->currentCity = weatherList[index];
 3. push to details screen
*/
