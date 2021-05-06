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


public class Tempmax extends FWSimComponent
{
    private FWSimVariable<Double> prof;
    private FWSimVariable<Double> tminseuil;
    private FWSimVariable<Double> tmaxseuil;
    private FWSimVariable<Double> tmax;
    private FWSimVariable<Double> Sdepth_cm;
    private FWSimVariable<Double> tmaxrec;

    public Tempmax(String aName, HashMap<String, FWSimVariable<?>> aFieldMap, HashMap<String, String> aInputMap, Element aSimComponentElement, FWSimVarMap aVarMap, int aOrderNumber)
    {
        super(aName, aFieldMap, aInputMap, aSimComponentElement, aVarMap, aOrderNumber);
    }

    public Tempmax(){
        super();
    }
    @Override
    protected void process()
    {
        double tSdepth_cm = Sdepth_cm.getValue();
        double tprof = prof.getValue();
        double ttmax = tmax.getValue();
        double ttminseuil = tminseuil.getValue();
        double ttmaxseuil = tmaxseuil.getValue();
        double ttmaxrec;
        ttmaxrec = ttmax;
        if (tSdepth_cm > tprof)
        {
            if (ttmax < ttminseuil)
            {
                ttmaxrec = ttminseuil;
            }
            else
            {
                if (ttmax > ttmaxseuil)
                {
                    ttmaxrec = ttmaxseuil;
                }
            }
        }
        else
        {
            if (tSdepth_cm > 0.0d)
            {
                if (ttmax <= 0.0d)
                {
                    ttmaxrec = ttmaxseuil - ((1 - (tSdepth_cm / tprof)) * -ttmax);
                }
                else
                {
                    ttmaxrec = 0.0d;
                }
            }
        }
        tmaxrec.setValue(ttmaxrec, this);
    }

    @Override
    protected void init()
    {
    }

    @Override
    protected FWSimComponent clone(FWSimVarMap aVarMap)
    {
        return new Tempmax(iName, iFieldMap, iInputMap, iSimComponentElement, aVarMap, iOrderNumber);
    }

    @Override
    public HashMap<String, FWSimVariable<?>> createVariables()
    {
        addVariable(FWSimVariable.createSimVariable("cprof", "snow cover threshold for snow insulation ", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 1000, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("ctminseuil", "minimum temperature when snow cover is higher than prof", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 5000.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("ctmaxseuil", "maximum temperature when snow cover is higher than prof", DATA_TYPE.DOUBLE, CONTENT_TYPE.constant,"http://www.wurvoc.org/vocabularies/om-1.8/", null, null, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("itmax", "current maximum air temperature", DATA_TYPE.DOUBLE, CONTENT_TYPE.input,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 100.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("sSdepth_cm", "snow depth", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, 0.0, this));
        addVariable(FWSimVariable.createSimVariable("stmaxrec", "recalculated maximum temperature", DATA_TYPE.DOUBLE, CONTENT_TYPE.state,"http://www.wurvoc.org/vocabularies/om-1.8/", 0.0, 500.0, null, this));

        return iFieldMap;
    }
}