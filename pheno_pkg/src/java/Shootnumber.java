import  java.io.*;
import  java.util.*;
public class Shootnumber
{
    private double sowingDensity;
    public double getsowingDensity()
    {
        return sowingDensity;
    }

    public void setsowingDensity(double _sowingDensity)
    {
        this.sowingDensity= _sowingDensity;
    } 
    
    private double targetFertileShoot;
    public double gettargetFertileShoot()
    {
        return targetFertileShoot;
    }

    public void settargetFertileShoot(double _targetFertileShoot)
    {
        this.targetFertileShoot= _targetFertileShoot;
    } 
    
    public Shootnumber()
    {
           
    }
    public void  Calculate_shootnumber(PhenologyState s, PhenologyRate r, PhenologyAuxiliary a)
    {
        //- Description:
    //            - Model Name: CalculateShootNumber Model
    //            - Author: Pierre MARTRE
    //            - Reference: Modeling development phase in the 
    //                Wheat Simulation Model SiriusQuality.
    //                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    //            - Institution: INRA/LEPSE Montpellier
    //            - Abstract: calculate the shoot number and update the related variables if needed
        //- inputs:
    //            - name: canopyShootNumber
    //                          - description : shoot number for the whole canopy
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 288.0
    //                          - unit : shoot m-2
    //                          - inputtype : variable
    //            - name: leafNumber
    //                          - description : Leaf number 
    //                          - variablecategory : state
    //                          - inputtype : variable
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 0
    //                          - unit : leaf
    //            - name: sowingDensity
    //                          - description : number of plant /m²
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 500
    //                          - default : 288.0
    //                          - unit : plant m-2
    //                          - inputtype : parameter
    //            - name: targetFertileShoot
    //                          - description : max value of shoot number for the canopy
    //                          - parametercategory : species
    //                          - datatype : DOUBLE
    //                          - min : 280
    //                          - max : 1000
    //                          - default : 600.0
    //                          - unit : shoot
    //                          - inputtype : variable
    //            - name: tilleringProfile
    //                          - description :  store the amount of new tiller created at each time a new tiller appears
    //                          - variablecategory : state
    //                          - datatype : DOUBLELIST
    //                          - default : [288.0]
    //                          - unit : 
    //                          - inputtype : variable
    //            - name: leafTillerNumberArray
    //                          - description : store the number of tiller for each leaf layer
    //                          - variablecategory : state
    //                          - datatype : INTLIST
    //                          - unit : leaf
    //                          - default : [1]
    //                          - inputtype : variable
    //            - name: tillerNumber
    //                          - description :  Number of tiller which appears
    //                          - variablecategory : state
    //                          - datatype : INT
    //                          - min : 0
    //                          - max : 10000
    //                          - default : 1
    //                          - unit : 
    //                          - inputtype : variable
        //- outputs:
    //            - name: averageShootNumberPerPlant
    //                          - description : average shoot number per plant in the canopy
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - unit : shoot m-2
    //            - name: canopyShootNumber
    //                          - description : shoot number for the whole canopy
    //                          - variablecategory : state
    //                          - datatype : DOUBLE
    //                          - min : 0
    //                          - max : 10000
    //                          - unit : shoot m-2
    //            - name: leafTillerNumberArray
    //                          - description : store the number of tiller for each leaf layer
    //                          - variablecategory : state
    //                          - datatype : INTLIST
    //                          - unit : leaf
    //            - name: tilleringProfile
    //                          - description :  store the amount of new tiller created at each time a new tiller appears
    //                          - variablecategory : state
    //                          - datatype : DOUBLELIST
    //                          - unit : 
    //            - name: tillerNumber
    //                          - description :  store the amount of new tiller created at each time a new tiller appears
    //                          - variablecategory : state
    //                          - datatype : INT
    //                          - min : 0
    //                          - max : 10000
    //                          - unit : 
        double canopyShootNumber = s.getcanopyShootNumber();
        double leafNumber = s.getleafNumber();
        List<Double> tilleringProfile = s.gettilleringProfile();
        List<Integer> leafTillerNumberArray = s.getleafTillerNumberArray();
        int tillerNumber = s.gettillerNumber();
        double averageShootNumberPerPlant;
        double oldCanopyShootNumber;
        int emergedLeaves;
        int shoots;
        int i;
        oldCanopyShootNumber = canopyShootNumber;
        emergedLeaves = (int)(Math.max(1.0d, Math.ceil(leafNumber - 1.0d)));
        shoots = fibonacci(emergedLeaves);
        canopyShootNumber = Math.min(shoots * sowingDensity, targetFertileShoot);
        averageShootNumberPerPlant = canopyShootNumber / sowingDensity;
        if (canopyShootNumber != oldCanopyShootNumber)
        {
            tilleringProfile.add(canopyShootNumber - oldCanopyShootNumber);
        }
        tillerNumber = tilleringProfile.size();
        for (i=leafTillerNumberArray.size() ; i<(int)(Math.ceil(leafNumber)) ; i+=1)
        {
            leafTillerNumberArray.add(tillerNumber);
        }
        s.setcanopyShootNumber(canopyShootNumber);
        s.settilleringProfile(tilleringProfile);
        s.setleafTillerNumberArray(leafTillerNumberArray);
        s.settillerNumber(tillerNumber);
        s.setaverageShootNumberPerPlant(averageShootNumberPerPlant);
    }
    public static int fibonacci(int n)
    {
        int result;
        int b;
        int i;
        int temp;
        result = 0;
        b = 1;
        for (i=0 ; i<n ; i+=1)
        {
            temp = result;
            result = b;
            b = temp + b;
        }
        return result;
    }
}