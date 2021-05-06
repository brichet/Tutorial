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


public class Snowaccumulation extends FWSimComponent
{
    private FWSimVariable<Double> tsmax;
    private FWSimVariable<Double> trmax;
    private FWSimVariable<Double> tmax;
    private FWSimVariable<Double> precip;
    private FWSimVariable<Double> Snowaccu;

    public Snowaccumulation(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Snowaccumulation(){
        super();
    }
    @Override
    protected void process()
    {
        double ttsmax = tsmax.getValue();
        double ttmax = tmax.getValue();
        double ttrmax = trmax.getValue();
        double tprecip = precip.getValue();
        double tSnowaccu;
        double fs = 0.0d;
        if (ttmax < ttsmax)
        {
            fs = 1.0d;
        }
        if (ttmax >= ttsmax && ttmax <= ttrmax)
        {
            fs = (ttrmax - ttmax) / (ttrmax - ttsmax);
        }
        tSnowaccu = fs * tprecip * 1;
        Snowaccu.setValue(tSnowaccu, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Snowaccumulation(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("ctsmax", "maximum daily air temperature (tmax) below which all precipitation is assumed to be snow", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 1000, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("ctrmax", "tmax above which all precipitation is assumed to be rain", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("itmax", "current maximum air temperature", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("iprecip", "recalculated precipitation", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("rSnowaccu", "snowfall accumulation", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, null, this));

        return iFieldMap;
    }
}