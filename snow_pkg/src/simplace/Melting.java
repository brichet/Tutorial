import  java.io.*;
import  java.util.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javafx.util.*;
import java.time.LocalDateTime;
import java.time.LocalDateTime;
import net.simplace.sim.model.FWSimComponent;
import net.simplace.sim.util.FWSimVarMap;
import net.simplace.sim.util.FWSimVariable;
import net.simplace.sim.util.FWSimVariable.CONTENT_TYPE;
import net.simplace.sim.util.FWSimVariable.DATA_TYPE;
import org.jdom.Element;


public class Melting extends FWSimComponent
{
    private FWSimVariable<Double> Tmf;
    private FWSimVariable<Double> DKmax;
    private FWSimVariable<Double> Kmin;
    private FWSimVariable<Integer> jul;
    private FWSimVariable<Double> tavg;
    private FWSimVariable<Double> M;

    public Melting(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Melting(){
        super();
    }
    @Override
    protected void process()
    {
        int tjul = jul.getValue();
        double tTmf = Tmf.getValue();
        double tDKmax = DKmax.getValue();
        double tKmin = Kmin.getValue();
        double ttavg = tavg.getValue();
        double tM;
        double K;
        tM = 0.0d;
        K = tDKmax / 2.0d * -Math.sin((2.0d * Math.PI * (double)(tjul) / 366.0d + (9.0d / 16.0d * Math.PI))) + tKmin + (tDKmax / 2.0d);
        if (ttavg > tTmf)
        {
            tM = K * (ttavg - tTmf);
        }
        M.setValue(tM, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Melting(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("cTmf", "threshold temperature for snow melting ", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 1.0, 0.5, this));
        addVariable(FWSimVariable.createSimVariable("cDKmax", "difference between the maximum and the minimum melting rates", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("cKmin", "minimum melting rate on 21 December", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("ijul", "current day of year for the calculation", DATA_TYPE.INT, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0, 366, 0, this));
        addVariable(FWSimVariable.createSimVariable("itavg", "average temperature", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("rM", "snow in the process of melting", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, null, this));

        return iFieldMap;
    }
}