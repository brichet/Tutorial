import numpy 
from math import *

def model_updatecalendar(float cumulTT=741.510096671757,
                         list calendarMoments=['Sowing'],
                         list calendarDates=['21/3/2007'],
                         list calendarCumuls=[0.0],
                         str currentdate='27/3/2007',
                         float phase=1.0):
    """

    Calendar Model
    Author: Pierre Martre
    Reference: Modeling development phase in the 
                Wheat Simulation Model SiriusQuality.
                See documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=427
    Institution: INRA Montpellier
    Abstract: Lists containing for each stage the date it occurs as well as a copy of all types of cumulated thermal times 

    """
    if (phase >= 1.0 and phase < 2.0) and ("Emergence" not in calendarMoments ):
        calendarMoments.append("Emergence")
        calendarCumuls.append(cumulTT)
        calendarDates.append(currentdate)
    elif (phase >= 2.0 and phase < 3.0)  and ("FloralInitiation" not in calendarMoments ):
        calendarMoments.append("FloralInitiation") 
        calendarCumuls.append(cumulTT)
        calendarDates.append(currentdate)
    elif (phase >= 3.0 and phase < 4.0)  and ("Heading" not in calendarMoments ):
        calendarMoments.append("Heading")
        calendarCumuls.append(cumulTT)
        calendarDates.append(currentdate)
    elif (phase == 4.0)  and ("Anthesis" not in calendarMoments ):
        calendarMoments.append("Anthesis")
        calendarCumuls.append(cumulTT)
        calendarDates.append(currentdate)
    elif (phase == 4.5)  and ("EndCellDivision" not in calendarMoments ):
        calendarMoments.append("EndCellDivision")
        calendarCumuls.append(cumulTT)
        calendarDates.append(currentdate)
    elif (phase >= 5.0 and phase < 6.0) and ("EndGrainFilling" not in calendarMoments ):
        calendarMoments.append("EndGrainFilling")
        calendarCumuls.append(cumulTT)
        calendarDates.append(currentdate)
    elif (phase >= 6.0 and phase < 7.0)  and ("Maturity" not in calendarMoments ):
        calendarMoments.append("Maturity")
        calendarCumuls.append(cumulTT)
        calendarDates.append(currentdate)
    return  calendarMoments, calendarDates, calendarCumuls