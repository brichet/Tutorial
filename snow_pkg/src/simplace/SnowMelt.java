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


public class Snowmelt extends FWSimComponent
{
    private FWSimVariable<Double> ps;
    private FWSimVariable<Double> Snowmelt;
    private FWSimVariable<Double> M;

    public Snowmelt(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Snowmelt(){
        super();
    }
    @Override
    protected void process()
    {
        double tps = ps.getValue();
        double tM = M.getValue();
        double tSnowmelt;
        tSnowmelt = 0.0d;
        if (tps > 1e-8d)
        {
            tSnowmelt = tM / tps;
        }
        Snowmelt.setValue(tSnowmelt, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Snowmelt(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("sps", "density of snow cover", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSnowmelt", "Snow melt", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, null, this));
        addVariable(FWSimVariable.createSimVariable("rM", "snow in the process of melting", DATA_TYPE.DOUBLE, CONTENT_TYPE.rate,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));

        return iFieldMap;
    }
}