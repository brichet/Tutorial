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


public class Snowdepthtrans extends FWSimComponent
{
    private FWSimVariable<Double> Pns;
    private FWSimVariable<Double> Sdepth;
    private FWSimVariable<Double> Sdepth_cm;

    public Snowdepthtrans(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Snowdepthtrans(){
        super();
    }
    @Override
    protected void process()
    {
        double tSdepth = Sdepth.getValue();
        double tPns = Pns.getValue();
        double tSdepth_cm;
        tSdepth_cm = tSdepth * tPns;
        Sdepth_cm.setValue(tSdepth_cm, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Snowdepthtrans(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("cPns", "density of the new snow", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 100.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdepth", "snow cover depth Calculation", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdepth_cm", "snow cover depth in cm", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, null, this));

        return iFieldMap;
    }
}