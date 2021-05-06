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


public class Snowdry extends FWSimComponent
{
    private FWSimVariable<Double> Sdry_t1;
    private FWSimVariable<Double> Snowaccu;
    private FWSimVariable<Double> Mrf;
    private FWSimVariable<Double> M;
    private FWSimVariable<Double> Sdry;

    public Snowdry(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Snowdry(){
        super();
    }
    @Override
    protected void process()
    {
        double tSdry_t1 = Sdry_t1.getValue();
        double tSnowaccu = Snowaccu.getValue();
        double tMrf = Mrf.getValue();
        double tM = M.getValue();
        double tSdry;
        double tmp_sdry;
        tSdry = 0.0d;
        if (tM * 1 <= tSdry_t1)
        {
            tmp_sdry = tSnowaccu + tMrf - tM + tSdry_t1;
            if (tmp_sdry < 0.0d)
            {
                tSdry = 0.001d;
            }
            else
            {
                tSdry = tmp_sdry;
            }
        }
        Sdry.setValue(tSdry, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Snowdry(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("sSdry", "water in solid state in the snow cover in previous day", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSnowaccu", "snowfall accumulation", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sMrf", "liquid water in the snow cover in the process of refreezing", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sM", "snow in the process of melting", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));

        return iFieldMap;
    }
}