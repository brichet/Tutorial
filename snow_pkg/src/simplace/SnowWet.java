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


public class Snowwet extends FWSimComponent
{
    private FWSimVariable<Double> precip;
    private FWSimVariable<Double> Swet_t1;
    private FWSimVariable<Double> Sdry;
    private FWSimVariable<Double> Swet;
    private FWSimVariable<Double> Snowaccu;
    private FWSimVariable<Double> Mrf;
    private FWSimVariable<Double> M;

    public Snowwet(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Snowwet(){
        super();
    }
    @Override
    protected void process()
    {
        double tSwet_t1 = Swet_t1.getValue();
        double tprecip = precip.getValue();
        double tSnowaccu = Snowaccu.getValue();
        double tMrf = Mrf.getValue();
        double tM = M.getValue();
        double tSdry = Sdry.getValue();
        double tSwet;
        double frac_sdry;
        double tmp_swet;
        tSwet = 0.0d;
        if (tMrf <= tSwet_t1)
        {
            tmp_swet = tSwet_t1 + tprecip - tSnowaccu + tM - tMrf;
            frac_sdry = 0.1d * tSdry;
            if (tmp_swet < frac_sdry)
            {
                tSwet = tmp_swet;
            }
            else
            {
                tSwet = frac_sdry;
            }
        }
        Swet.setValue(tSwet, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Snowwet(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("iprecip", "current precipitation", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSwet", "water in liquid state in the snow cover in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdry", "water in solid state in the snow cover", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("rSnowaccu", " snowfall accumulation", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("rMrf", "liquid water in the snow cover in the process of refreezing", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("rM", "snow in the process of melting", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));

        return iFieldMap;
    }
}