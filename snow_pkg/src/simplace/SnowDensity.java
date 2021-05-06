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


public class Snowdensity extends FWSimComponent
{
    private FWSimVariable<Double> ps_t1;
    private FWSimVariable<Double> Sdepth_t1;
    private FWSimVariable<Double> Sdry_t1;
    private FWSimVariable<Double> Swet_t1;
    private FWSimVariable<Double> ps;

    public Snowdensity(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Snowdensity(){
        super();
    }
    @Override
    protected void process()
    {
        double tps_t1 = ps_t1.getValue();
        double tSdepth_t1 = Sdepth_t1.getValue();
        double tSdry_t1 = Sdry_t1.getValue();
        double tSwet_t1 = Swet_t1.getValue();
        double tps;
        tps = 0.0d;
        if (Math.abs(tSdepth_t1) > 0.0d)
        {
            if (Math.abs(tSdry_t1 + tSwet_t1) > 0.0d)
            {
                tps = (tSdry_t1 + tSwet_t1) / tSdepth_t1;
            }
            else
            {
                tps = tps_t1;
            }
        }
        ps.setValue(tps, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Snowdensity(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("sps", "density of snow cover in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdepth", "snow cover depth Calculation in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdry", "water in solid state in the snow cover in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSwet", "water in liquid state in the snow cover", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));

        return iFieldMap;
    }
}