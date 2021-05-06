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


public class Tavg extends FWSimComponent
{
    private FWSimVariable<Double> tmin;
    private FWSimVariable<Double> tmax;
    private FWSimVariable<Double> tavg;

    public Tavg(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Tavg(){
        super();
    }
    @Override
    protected void process()
    {
        double ttmin = tmin.getValue();
        double ttmax = tmax.getValue();
        double ttavg;
        ttavg = (ttmin + ttmax) / 2;
        tavg.setValue(ttavg, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Tavg(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("itmin", "current minimum air temperature", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("itmax", "current maximum air temperature", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("tavg", "mean temperature", DATA_TYPE.DOUBLE, CONTENT_TYPE.out,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, null, this));

        return iFieldMap;
    }
}