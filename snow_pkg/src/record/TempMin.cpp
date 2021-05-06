// @@tagdynamic@@
// @@tagdepends: vle.discrete-time @@endtagdepends

#include <vle/DiscreteTime.hpp>
namespace vd = vle::devs;
namespace vv = vle::value;
// Definition du namespace de la classe du modele
namespace record {
namespace Snow {
using namespace vle::discrete_time;
class Tempmin: public DiscreteTimeDyn {
public:
    Tempmin(const vd::DynamicsInit& atom, const vd::InitEventList& events) : DiscreteTimeDyn(atom, events)
    {
        // Ces parametres ont une valeur par defaut utilise si la condition n'est pas definie
        prof = (events.exist("prof")) ? vv::toDouble(events.get("prof")) : 0.0;
        tminseuil = (events.exist("tminseuil")) ? vv::toDouble(events.get("tminseuil")) : 0.0;
        tmaxseuil = (events.exist("tmaxseuil")) ? vv::toDouble(events.get("tmaxseuil")) : 0.0;
        //  Variables gérées par ce composant
        tminrec.init(this,"tminrec", events);
        //  Variables gérées par un autre composant
        Sdepth_cm.init(this,"Sdepth_cm", events);
        tmin.init(this,"tmin", events);
    }
    /**
    * @brief Destructeur de la classe du modèle.
    **/
    virtual ~Tempmin() {};
    /**
    * @brief Methode de calcul effectuée à chaque pas de temps
    * @param time la date du pas de temps courant
    */
    virtual void compute(const vd::Time& /*time*/)
    {
        tminrec = tmin();
        if (Sdepth_cm() > prof)
        {
            if (tmin() < tminseuil)
            {
                tminrec = tminseuil;
            }
            else
            {
                if (tmin() > tmaxseuil)
                {
                    tminrec = tmaxseuil;
                }
            }
        }
        else
        {
            if (Sdepth_cm() > 0.0d)
            {
                tminrec = tminseuil - ((1 - (Sdepth_cm() / prof)) * (abs(tmin()) + tminseuil));
            }
        }
    }
private:
    //Variables d'etat
    /**
    * @brief recalculated minimum temperature (degC)
    */
    Var tminrec

    //Entrées
    /**
        * @brief snow depth (cm)
        */
    Var Sdepth_cm/**
        * @brief current minimum air temperature (degC)
        */
    Var tmin

    //Paramètres du modele
    /**
    * @brief snow cover threshold for snow insulation  (cm)
    */
    double prof;
    /**
    * @brief minimum temperature when snow cover is higher than prof (degC)
    */
    double tminseuil;
    /**
    * @brief maximum temperature when snow cover is higher than prof (degC)
    */
    double tmaxseuil;
};
}
}
DECLARE_DYNAMICS(record::Snow::Tempmin); // balise specifique VLE