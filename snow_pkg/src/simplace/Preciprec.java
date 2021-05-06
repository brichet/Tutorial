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


public class Preciprec extends FWSimComponent
{
    private FWSimVariable<Double> rho;
    private FWSimVariable<Double> precip;
    private FWSimVariable<Double> Sdry_t1;
    private FWSimVariable<Double> Sdry;
    private FWSimVariable<Double> Swet;
    private FWSimVariable<Double> Swet_t1;
    private FWSimVariable<Double> Sdepth_t1;
    private FWSimVariable<Double> Sdepth;
    private FWSimVariable<Double> preciprec;
    private FWSimVariable<Double> Mrf;
    private FWSimVariable<Double> Snowaccu;

    public Preciprec(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Preciprec(){
        super();
    }
    @Override
    protected void process()
    {
        double tSdry_t1 = Sdry_t1.getValue();
        double tSdry = Sdry.getValue();
        double tSwet = Swet.getValue();
        double tSwet_t1 = Swet_t1.getValue();
        double tSdepth_t1 = Sdepth_t1.getValue();
        double tSdepth = Sdepth.getValue();
        double tMrf = Mrf.getValue();
        double tprecip = precip.getValue();
        double tSnowaccu = Snowaccu.getValue();
        double trho = rho.getValue();
        double tpreciprec;
        tpreciprec = tprecip;
        if (tSdry + tSwet < tSdry_t1 + tSwet_t1)
        {
            tpreciprec = tpreciprec + ((tSdepth_t1 - tSdepth) * trho) - tMrf;
        }
        tpreciprec = tpreciprec - tSnowaccu;
        preciprec.setValue(tpreciprec, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Preciprec(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("crho", "The density of the new snow fixed by the user", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 100, this));
        addVariable(FWSimVariable.createSimVariable("iprecip", "recalculated precipitation", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdry", "water in solid state in the snow cover in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSwet", "water in liquid state in the snow cover", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSwet_t1", "water in liquid state in the snow cover in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdepth", "snow cover depth Calculation in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("spreciprec", "precipitation recalculation", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, null, this));
        addVariable(FWSimVariable.createSimVariable("rMrf", "liquid water in the snow cover in the process of refreezing", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("rSnowaccu", "snowfall accumulation", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));

        return iFieldMap;
    }
}