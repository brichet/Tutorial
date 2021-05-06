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


public class Snowdepth extends FWSimComponent
{
    private FWSimVariable<Double> E;
    private FWSimVariable<Double> rho;
    private FWSimVariable<Double> Snowmelt;
    private FWSimVariable<Double> Sdepth_t1;
    private FWSimVariable<Double> Sdepth;
    private FWSimVariable<Double> Snowaccu;

    public Snowdepth(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Snowdepth(){
        super();
    }
    @Override
    protected void process()
    {
        double tSnowmelt = Snowmelt.getValue();
        double tSdepth_t1 = Sdepth_t1.getValue();
        double tSnowaccu = Snowaccu.getValue();
        double tE = E.getValue();
        double trho = rho.getValue();
        double tSdepth;
        tSdepth = 0.0d;
        if (tSnowmelt <= tSdepth_t1 + (tSnowaccu / trho))
        {
            tSdepth = tSnowaccu / trho + tSdepth_t1 - tSnowmelt - (tSdepth_t1 * tE);
        }
        Sdepth.setValue(tSdepth, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Snowdepth(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("cE", "snow compaction parameter", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("crho", "The density of the new snow fixed by the user", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 100, this));
        addVariable(FWSimVariable.createSimVariable("sSnowmelt", "snow melt ", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdepth", "snow cover depth Calculation in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("rSnowaccu", "snowfall accumulation", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));

        return iFieldMap;
    }
}