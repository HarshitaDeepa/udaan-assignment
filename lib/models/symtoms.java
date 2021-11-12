package models;

public class symtoms {
    String[] symtom = new String[]{"fever", "cold", "cough"};


    boolean travel_history = true;
    boolean contact_with_posPatient = true;
    int risk = 0;

     int riskCalculation(){
        if(symtom.length == 0 && !travel_history && !contact_with_posPatient){
            risk = 5;
        }
        else if(symtom.length == 1 && (travel_history == true || contact_with_posPatient == true)){
            risk = 50;
        }
        else if(symtom.length == 2 && (travel_history == true || contact_with_posPatient == true)) risk = 75;
        else risk = 95;
        return risk;
     }

}
