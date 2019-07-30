from Phyllochron import model_phyllochron
from Phylsowingdatecorrection import model_phylsowingdatecorrection
from Shootnumber import model_shootnumber
from Updateleafflag import model_updateleafflag
from Updatephase import model_updatephase
from Leafnumber import model_leafnumber
from Vernalizationprogress import model_vernalizationprogress
from Ismomentregistredzc_39 import model_ismomentregistredzc_39
from Cumulttfrom import model_cumulttfrom
from Updatecalendar import model_updatecalendar
from Registerzadok import model_registerzadok
def model_phenology(float leafNumber=0.0,
      float lincr=8.0,
      float ldecr=10.0,
      float pdecr=0.4,
      float pincr=1.5,
      float ptq=0.0,
      float gai=0.0,
      float pastMaxAI=0.0,
      float kl=0.45,
      float aPTQ=0.842934,
      float phylPTQ1=20.0,
      float p=120.0,
      str choosePhyllUse='Default',
      list calendarMoments=['Sowing'],
      int sowingDay=1,
      int sDsa_sh=1,
      int sDws=1,
      int sDsa_nh=1,
      float rp=0.0,
      float latitude=0.0,
      list calendarCumuls=[0.0],
      float cumulTT=8.0,
      int isVernalizable=1,
      float vernaprog=0.5517254187376879,
      float deltaTT=20.3429985011972,
      float minTvern=0.0,
      float intTvern=11.0,
      float vAI=0.015,
      float vBEE=0.01,
      float minDL=8.0,
      float maxDL=15.0,
      float dayLength=12.3037621834005,
      float maxTvern=23.0,
      float pNini=4.0,
      float minFinalNumber=5.5,
      float aMXLFNO=24.0,
      str currentdate='27/3/2007',
      list calendarDates=['21/3/2007'],
      float dse=105.0,
      float pFLLAnth=2.22,
      float dcd=100.0,
      float dgf=450.0,
      float degfm=0.0,
      bool ignoreGrainMaturation=False,
      float pHEADANTH=1.0,
      float finalLeafNumber=0.0,
      float sLDL=0.85,
      float grainCumulTT=0.0,
      float phase=1.0,
      int hasLastPrimordiumAppeared=0,
      int hasFlagLeafLiguleAppeared=0,
      float canopyShootNumber=288.0,
      float sowingDensity=288.0,
      float targetFertileShoot=600.0,
      list tilleringProfile=[288.0],
      list leafTillerNumberArray=[1],
      int tillerNumber=1,
      float slopeTSFLN=0.9,
      float intTSFLN=0.9,
      float der=300.0,
      str currentZadokStage='MainShootPlus1Tiller',
      int hasZadokStageChanged=0):
    cdef float fixPhyll
    cdef float phyllochron
    cdef float averageShootNumberPerPlant
    cdef float cumulTTFromZC_39
    cdef int isMomentRegistredZC_39
    cdef float cumulTTFromZC_91
    cdef float cumulTTFromZC_65
    cumulTTFromZC_65, cumulTTFromZC_39, cumulTTFromZC_91 = model_cumulttfrom( calendarMoments,calendarCumuls,cumulTT)
    isMomentRegistredZC_39 = model_ismomentregistredzc_39( calendarMoments)
    vernaprog, minFinalNumber, calendarMoments, calendarDates, calendarCumuls = model_vernalizationprogress( dayLength,deltaTT,cumulTT,leafNumber,calendarMoments,calendarDates,calendarCumuls,minTvern,intTvern,vAI,vBEE,minDL,maxDL,maxTvern,pNini,aMXLFNO,vernaprog,currentdate,isVernalizable,minFinalNumber)
    fixPhyll = model_phylsowingdatecorrection( sowingDay,latitude,sDsa_sh,rp,sDws,sDsa_nh,p)
    phyllochron, pastMaxAI = model_phyllochron( fixPhyll,leafNumber,lincr,ldecr,pdecr,pincr,ptq,gai,pastMaxAI,kl,aPTQ,phylPTQ1,p,choosePhyllUse)
    finalLeafNumber, phase, hasLastPrimordiumAppeared = model_updatephase( cumulTT,leafNumber,cumulTTFromZC_39,isMomentRegistredZC_39,gai,grainCumulTT,dayLength,vernaprog,minFinalNumber,fixPhyll,isVernalizable,dse,pFLLAnth,dcd,dgf,degfm,maxDL,sLDL,ignoreGrainMaturation,pHEADANTH,choosePhyllUse,p,phase,cumulTTFromZC_91,phyllochron,hasLastPrimordiumAppeared,finalLeafNumber)
    leafNumber = model_leafnumber( deltaTT,phyllochron,hasFlagLeafLiguleAppeared,leafNumber,phase)
    averageShootNumberPerPlant, canopyShootNumber, leafTillerNumberArray, tilleringProfile, tillerNumber = model_shootnumber( canopyShootNumber,leafNumber,sowingDensity,targetFertileShoot,tilleringProfile,leafTillerNumberArray,tillerNumber)
    hasFlagLeafLiguleAppeared, calendarMoments, calendarDates, calendarCumuls = model_updateleafflag( cumulTT,leafNumber,calendarMoments,calendarDates,calendarCumuls,currentdate,finalLeafNumber,hasFlagLeafLiguleAppeared,phase)
    hasZadokStageChanged, currentZadokStage, calendarMoments, calendarDates, calendarCumuls = model_registerzadok( cumulTT,phase,leafNumber,calendarMoments,calendarDates,calendarCumuls,cumulTTFromZC_65,currentdate,der,slopeTSFLN,intTSFLN,finalLeafNumber,currentZadokStage,hasZadokStageChanged)
    calendarMoments, calendarDates, calendarCumuls = model_updatecalendar( cumulTT,calendarMoments,calendarDates,calendarCumuls,currentdate,phase)
    return hasZadokStageChanged, currentZadokStage, phyllochron, pastMaxAI, calendarMoments, calendarDates, calendarCumuls, vernaprog, canopyShootNumber, leafNumber, phase, tillerNumber, tilleringProfile, leafTillerNumberArray, averageShootNumberPerPlant, minFinalNumber, finalLeafNumber, hasFlagLeafLiguleAppeared, hasLastPrimordiumAppeared