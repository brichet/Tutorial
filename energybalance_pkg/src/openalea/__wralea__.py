
# This file has been generated at Thu May  6 09:15:01 2021

from openalea.core import *


__name__ = 'EnergyBalance'

__editable__ = True
__description__ = 'CropML Model library.'
__license__ = 'CECILL-C'
__url__ = 'http://pycropml.rtfd.org'
__alias__ = []
__version__ = '0.0.1'
__authors__ = 'OpenAlea Consortium'
__institutes__ = 'INRA/CIRAD'
__icon__ = ''


__all__ = ['PotentialTranspiration_model_PotentialTranspiration', 'DiffusionLimitedEvaporation_model_DiffusionLimitedEvaporation', 'CropHeatFlux_model_CropHeatFlux', 'PtSoil_model_PtSoil', 'NetRadiation_model_NetRadiation', 'PriestlyTaylor_model_PriestlyTaylor', '_140100496', 'CanopyTemperature_model_CanopyTemperature', 'EvapoTranspiration_model_EvapoTranspiration', 'SoilEvaporation_model_SoilEvaporation', 'Penman_model_Penman', 'SoilHeatFlux_model_SoilHeatFlux', 'NetRadiationEquivalentEvaporation_model_NetRadiationEquivalentEvaporation', 'Conductance_model_Conductance']



PotentialTranspiration_model_PotentialTranspiration = Factory(name='PotentialTranspiration',
                authors='OpenAlea Consortium (wralea authors)',
                description='SiriusQuality2 uses availability of water from the soil reservoir as a method to restrict\n                    transpiration as soil moisture is depleted ',
                category='Unclassified',
                nodemodule='PotentialTranspiration',
                nodeclass='model_PotentialTranspiration',
                inputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'evapoTranspiration', 'value': 830.958}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'tau', 'value': 0.9983}],
                outputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'potentialTranspiration'}],
                widgetmodule=None,
                widgetclass=None,
               )




DiffusionLimitedEvaporation_model_DiffusionLimitedEvaporation = Factory(name='DiffusionLimitedEvaporation',
                authors='OpenAlea Consortium (wralea authors)',
                description='the evaporation from the diffusion limited soil ',
                category='Unclassified',
                nodemodule='DiffusionLimitedEvaporation',
                nodeclass='model_DiffusionLimitedEvaporation',
                inputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'deficitOnTopLayers', 'value': 5341}, {'interface': IFloat(min=0, max=10, step=1.000000), 'name': 'soilDiffusionConstant', 'value': 4.2}],
                outputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'diffusionLimitedEvaporation'}],
                widgetmodule=None,
                widgetclass=None,
               )




CropHeatFlux_model_CropHeatFlux = Factory(name='CropHeatFlux',
                authors='OpenAlea Consortium (wralea authors)',
                description='It is calculated from net Radiation, soil heat flux and potential transpiration ',
                category='Unclassified',
                nodemodule='CropHeatFlux',
                nodeclass='model_CropHeatFlux',
                inputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'netRadiationEquivalentEvaporation', 'value': 638.142}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'soilHeatFlux', 'value': 188.817}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'potentialTranspiration', 'value': 1.413}],
                outputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'cropHeatFlux'}],
                widgetmodule=None,
                widgetclass=None,
               )




PtSoil_model_PtSoil = Factory(name='PtSoil',
                authors='OpenAlea Consortium (wralea authors)',
                description='Evaporation from the soil in the energy-limited stage ',
                category='Unclassified',
                nodemodule='PtSoil',
                nodeclass='model_PtSoil',
                inputs=[{'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'evapoTranspirationPriestlyTaylor', 'value': 120}, {'interface': IFloat(min=0, max=100, step=1.000000), 'name': 'Alpha', 'value': 1.5}, {'interface': IFloat(min=0, max=100, step=1.000000), 'name': 'tau', 'value': 0.9983}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'tauAlpha', 'value': 0.3}],
                outputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'energyLimitedEvaporation'}],
                widgetmodule=None,
                widgetclass=None,
               )




NetRadiation_model_NetRadiation = Factory(name='NetRadiation',
                authors='OpenAlea Consortium (wralea authors)',
                description='It is calculated at the surface of the canopy and is givenby the difference between incoming and outgoing radiation of both short\n                     and long wavelength radiation ',
                category='Unclassified',
                nodemodule='NetRadiation',
                nodeclass='model_NetRadiation',
                inputs=[{'interface': IFloat(min=-30, max=45, step=1.000000), 'name': 'minTair', 'value': 0.7}, {'interface': IFloat(min=-30, max=45, step=1.000000), 'name': 'maxTair', 'value': 7.2}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'albedoCoefficient', 'value': 0.23}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'stefanBoltzman', 'value': 4.903e-09}, {'interface': IFloat(min=-500, max=10000, step=1.000000), 'name': 'elevation', 'value': 0}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'solarRadiation', 'value': 3}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'vaporPressure', 'value': 6.1}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'extraSolarRadiation', 'value': 11.7}],
                outputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'netRadiation'}, {'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'netOutGoingLongWaveRadiation'}],
                widgetmodule=None,
                widgetclass=None,
               )




PriestlyTaylor_model_PriestlyTaylor = Factory(name='PriestlyTaylor',
                authors='OpenAlea Consortium (wralea authors)',
                description='Calculate Energy Balance ',
                category='Unclassified',
                nodemodule='PriestlyTaylor',
                nodeclass='model_PriestlyTaylor',
                inputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'netRadiationEquivalentEvaporation', 'value': 638.142}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'hslope', 'value': 0.584}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'psychrometricConstant', 'value': 0.66}, {'interface': IFloat(min=0, max=100, step=1.000000), 'name': 'Alpha', 'value': 1.5}],
                outputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'evapoTranspirationPriestlyTaylor'}],
                widgetmodule=None,
                widgetclass=None,
               )




_140100496 = CompositeNodeFactory(name='EnergyBalance_wf',
                             description='\n\n\n    EnergyBalance\n    Author: Pierre MARTRE\n    Reference: Modelling energy balance in the wheat crop model SiriusQuality2: Evapotranspiration and canopy and soil temperature calculations\n    Institution: INRA/LEPSE\n    Abstract: see documentation at http://www1.clermont.inra.fr/siriusquality/?page_id=547\n',
                             category='',
                             doc='',
                             inputs=[  {  'interface': IFloat(min=-30, max=45, step=1.000000),
      'name': 'minTair',
      'value': 0.7},
   {  'interface': IFloat(min=-30, max=45, step=1.000000),
      'name': 'maxTair',
      'value': 7.2},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'albedoCoefficient',
      'value': 0.23},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'stefanBoltzman',
      'value': 4.903e-09},
   {  'interface': IFloat(min=-500, max=10000, step=1.000000),
      'name': 'elevation'},
   {  'interface': IFloat(min=0, max=1000, step=1.000000),
      'name': 'solarRadiation',
      'value': 3},
   {  'interface': IFloat(min=0, max=1000, step=1.000000),
      'name': 'vaporPressure',
      'value': 6.1},
   {  'interface': IFloat(min=0, max=1000, step=1.000000),
      'name': 'extraSolarRadiation',
      'value': 11.7},
   {  'interface': IFloat(min=0, max=10, step=1.000000),
      'name': 'lambdaV',
      'value': 2.454},
   {  'interface': IFloat(min=0, max=1000, step=1.000000),
      'name': 'hslope',
      'value': 0.584},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'psychrometricConstant',
      'value': 0.66},
   {  'interface': IFloat(min=0, max=100, step=1.000000),
      'name': 'Alpha',
      'value': 1.5},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'vonKarman',
      'value': 0.42},
   {  'interface': IFloat(min=0, max=10, step=1.000000),
      'name': 'heightWeatherMeasurements',
      'value': 2},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'zm',
      'value': 0.13},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'd',
      'value': 0.67},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'zh',
      'value': 0.013},
   {  'interface': IFloat(min=0, max=1000, step=1.000000),
      'name': 'plantHeight'},
   {  'interface': IFloat(min=0, max=1000000, step=1.000000),
      'name': 'wind',
      'value': 124000},
   {  'interface': IFloat(min=0, max=10000, step=1.000000),
      'name': 'deficitOnTopLayers',
      'value': 5341},
   {  'interface': IFloat(min=0, max=10, step=1.000000),
      'name': 'soilDiffusionConstant',
      'value': 4.2},
   {  'interface': IFloat(min=0, max=1000, step=1.000000),
      'name': 'VPDair',
      'value': 2.19},
   {  'interface': IFloat, 'name': 'rhoDensityAir', 'value': 1.225},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'specificHeatCapacityAir',
      'value': 0.00101},
   {  'interface': IFloat(min=0, max=100, step=1.000000),
      'name': 'tau',
      'value': 0.9983},
   {  'interface': IFloat(min=0, max=1, step=1.000000),
      'name': 'tauAlpha',
      'value': 0.3},
   {  'interface': IInt(min=0, max=1, step=1),
      'name': 'isWindVpDefined',
      'value': 1}],
                             outputs=[  {  'interface': IFloat(min=0, max=5000, step=1.000000),
      'name': 'netRadiation'},
   {  'interface': IFloat(min=0, max=5000, step=1.000000),
      'name': 'netOutGoingLongWaveRadiation'},
   {  'interface': IFloat(min=0, max=5000, step=1.000000),
      'name': 'netRadiationEquivalentEvaporation'},
   {  'interface': IFloat(min=0, max=10000, step=1.000000),
      'name': 'evapoTranspirationPriestlyTaylor'},
   {  'interface': IFloat(min=0, max=5000, step=1.000000),
      'name': 'diffusionLimitedEvaporation'},
   {  'interface': IFloat(min=0, max=5000, step=1.000000),
      'name': 'energyLimitedEvaporation'},
   {  'interface': IFloat(min=0, max=10000, step=1.000000),
      'name': 'conductance'},
   {  'interface': IFloat(min=0, max=5000, step=1.000000),
      'name': 'evapoTranspirationPenman'},
   {  'interface': IFloat(min=0, max=5000, step=1.000000),
      'name': 'soilEvaporation'},
   {  'interface': IFloat(min=0, max=10000, step=1.000000),
      'name': 'evapoTranspiration'},
   {  'interface': IFloat(min=0, max=10000, step=1.000000),
      'name': 'potentialTranspiration'},
   {  'interface': IFloat(min=0, max=10000, step=1.000000),
      'name': 'soilHeatFlux'},
   {  'interface': IFloat(min=0, max=10000, step=1.000000),
      'name': 'cropHeatFlux'},
   {  'interface': IFloat(min=-30, max=45, step=1.000000),
      'name': 'minCanopyTemperature'},
   {  'interface': IFloat(min=-30, max=45, step=1.000000),
      'name': 'maxCanopyTemperature'}],
                             elt_factory={  2: ('EnergyBalance', 'NetRadiation'),
   3: ('EnergyBalance', 'NetRadiationEquivalentEvaporation'),
   4: ('EnergyBalance', 'PriestlyTaylor'),
   5: ('EnergyBalance', 'Conductance'),
   6: ('EnergyBalance', 'DiffusionLimitedEvaporation'),
   7: ('EnergyBalance', 'Penman'),
   8: ('EnergyBalance', 'PtSoil'),
   9: ('EnergyBalance', 'SoilEvaporation'),
   10: ('EnergyBalance', 'EvapoTranspiration'),
   11: ('EnergyBalance', 'SoilHeatFlux'),
   12: ('EnergyBalance', 'PotentialTranspiration'),
   13: ('EnergyBalance', 'CropHeatFlux'),
   14: ('EnergyBalance', 'CanopyTemperature')},
                             elt_connections={  39809032L: ('__in__', 20, 6, 1),
   39809056L: ('__in__', 19, 6, 0),
   39809080L: ('__in__', 18, 5, 6),
   39809104L: ('__in__', 17, 5, 5),
   39809128L: ('__in__', 16, 5, 3),
   39809152L: ('__in__', 15, 5, 4),
   39809176L: ('__in__', 14, 5, 2),
   39809200L: ('__in__', 13, 5, 1),
   39809224L: ('__in__', 12, 5, 0),
   39809248L: ('__in__', 11, 4, 3),
   39809272L: ('__in__', 10, 4, 2),
   39809296L: ('__in__', 9, 4, 1),
   39809320L: ('__in__', 8, 3, 0),
   39809344L: ('__in__', 7, 2, 7),
   39809368L: ('__in__', 6, 2, 6),
   39809392L: ('__in__', 5, 2, 5),
   39809416L: ('__in__', 4, 2, 4),
   39809440L: ('__in__', 3, 2, 3),
   39809464L: ('__in__', 2, 2, 2),
   39809488L: ('__in__', 1, 2, 1),
   39809512L: ('__in__', 0, 2, 0),
   39809536L: (14, 1, '__out__', 14),
   39809560L: (14, 0, '__out__', 13),
   39809584L: (13, 0, '__out__', 12),
   39809608L: (11, 0, '__out__', 11),
   39809632L: (12, 0, '__out__', 10),
   39809656L: (10, 0, '__out__', 9),
   39809680L: (9, 0, '__out__', 8),
   39809704L: (7, 0, '__out__', 7),
   39809728L: (5, 0, '__out__', 6),
   39809752L: (8, 0, '__out__', 5),
   39809776L: (6, 0, '__out__', 4),
   39809800L: (4, 0, '__out__', 3),
   39809824L: (3, 0, '__out__', 2),
   39809848L: (2, 1, '__out__', 1),
   39809872L: (2, 0, '__out__', 0),
   39810184L: (13, 0, 14, 2),
   39810208L: (11, 0, 13, 1),
   39810232L: (12, 0, 13, 2),
   39810256L: (10, 0, 12, 0),
   39810280L: (9, 0, 11, 2),
   39810304L: (7, 0, 10, 2),
   39810328L: (5, 0, 14, 3),
   39810352L: (5, 0, 7, 8),
   39810376L: (8, 0, 9, 1),
   39810400L: (6, 0, 9, 0),
   39810424L: (4, 0, 10, 1),
   39810448L: (4, 0, 7, 0),
   39810472L: (4, 0, 8, 0),
   39810496L: (3, 0, 13, 0),
   39810520L: (3, 0, 11, 0),
   39810544L: (3, 0, 4, 0),
   39810568L: (2, 0, 3, 1),
   39810592L: ('__in__', 23, 14, 6),
   39810616L: ('__in__', 22, 14, 5),
   39810640L: ('__in__', 8, 14, 4),
   39810664L: ('__in__', 1, 14, 1),
   39810688L: ('__in__', 0, 14, 0),
   39810712L: ('__in__', 24, 12, 1),
   39810736L: ('__in__', 24, 11, 1),
   39810760L: ('__in__', 26, 10, 0),
   39810784L: ('__in__', 25, 8, 3),
   39810808L: ('__in__', 24, 8, 2),
   39810832L: ('__in__', 11, 8, 1),
   39810856L: ('__in__', 23, 7, 7),
   39810880L: ('__in__', 22, 7, 6),
   39810904L: ('__in__', 8, 7, 5),
   39810928L: ('__in__', 11, 7, 4),
   39810952L: ('__in__', 10, 7, 3),
   39810976L: ('__in__', 21, 7, 2),
   39811000L: ('__in__', 9, 7, 1)},
                             elt_data={  2: {  'block': False,
         'caption': 'NetRadiation',
         'delay': 0,
         'hide': True,
         'id': 2,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   3: {  'block': False,
         'caption': 'NetRadiationEquivalentEvaporation',
         'delay': 0,
         'hide': True,
         'id': 3,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   4: {  'block': False,
         'caption': 'PriestlyTaylor',
         'delay': 0,
         'hide': True,
         'id': 4,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   5: {  'block': False,
         'caption': 'Conductance',
         'delay': 0,
         'hide': True,
         'id': 5,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   6: {  'block': False,
         'caption': 'DiffusionLimitedEvaporation',
         'delay': 0,
         'hide': True,
         'id': 6,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   7: {  'block': False,
         'caption': 'Penman',
         'delay': 0,
         'hide': True,
         'id': 7,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   8: {  'block': False,
         'caption': 'PtSoil',
         'delay': 0,
         'hide': True,
         'id': 8,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   9: {  'block': False,
         'caption': 'SoilEvaporation',
         'delay': 0,
         'hide': True,
         'id': 9,
         'lazy': True,
         'port_hide_changed': set([]),
         'posx': 0,
         'posy': 0,
         'priority': 0,
         'use_user_color': True,
         'user_application': None,
         'user_color': None},
   10: {  'block': False,
          'caption': 'EvapoTranspiration',
          'delay': 0,
          'hide': True,
          'id': 10,
          'lazy': True,
          'port_hide_changed': set([]),
          'posx': 0,
          'posy': 0,
          'priority': 0,
          'use_user_color': True,
          'user_application': None,
          'user_color': None},
   11: {  'block': False,
          'caption': 'SoilHeatFlux',
          'delay': 0,
          'hide': True,
          'id': 11,
          'lazy': True,
          'port_hide_changed': set([]),
          'posx': 0,
          'posy': 0,
          'priority': 0,
          'use_user_color': True,
          'user_application': None,
          'user_color': None},
   12: {  'block': False,
          'caption': 'PotentialTranspiration',
          'delay': 0,
          'hide': True,
          'id': 12,
          'lazy': True,
          'port_hide_changed': set([]),
          'posx': 0,
          'posy': 0,
          'priority': 0,
          'use_user_color': True,
          'user_application': None,
          'user_color': None},
   13: {  'block': False,
          'caption': 'CropHeatFlux',
          'delay': 0,
          'hide': True,
          'id': 13,
          'lazy': True,
          'port_hide_changed': set([]),
          'posx': 0,
          'posy': 0,
          'priority': 0,
          'use_user_color': True,
          'user_application': None,
          'user_color': None},
   14: {  'block': False,
          'caption': 'CanopyTemperature',
          'delay': 0,
          'hide': True,
          'id': 14,
          'lazy': True,
          'port_hide_changed': set([]),
          'posx': 0,
          'posy': 0,
          'priority': 0,
          'use_user_color': True,
          'user_application': None,
          'user_color': None},
   '__in__': {  'block': False,
                'caption': 'In',
                'delay': 0,
                'hide': True,
                'id': 0,
                'lazy': True,
                'port_hide_changed': set([]),
                'posx': 0,
                'posy': 0,
                'priority': 0,
                'use_user_color': True,
                'user_application': None,
                'user_color': None},
   '__out__': {  'block': False,
                 'caption': 'Out',
                 'delay': 0,
                 'hide': True,
                 'id': 1,
                 'lazy': True,
                 'port_hide_changed': set([]),
                 'posx': 0,
                 'posy': 0,
                 'priority': 0,
                 'use_user_color': True,
                 'user_application': None,
                 'user_color': None}},
                             elt_value={  2: [],
   3: [],
   4: [],
   5: [],
   6: [],
   7: [],
   8: [],
   9: [],
   10: [],
   11: [],
   12: [],
   13: [],
   14: [],
   '__in__': [],
   '__out__': []},
                             elt_ad_hoc={  2: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   3: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   4: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   5: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   6: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   7: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   8: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   9: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   10: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   11: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   12: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   13: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   14: {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   '__in__': {'position': [0, 0], 'userColor': None, 'useUserColor': True},
   '__out__': {'position': [0, 0], 'userColor': None, 'useUserColor': True}},
                             lazy=True,
                             eval_algo=None,
                             )




CanopyTemperature_model_CanopyTemperature = Factory(name='CanopyTemperature',
                authors='OpenAlea Consortium (wralea authors)',
                description='It is calculated from the crop heat flux and the boundary layer conductance ',
                category='Unclassified',
                nodemodule='CanopyTemperature',
                nodeclass='model_CanopyTemperature',
                inputs=[{'interface': IFloat(min=-30, max=45, step=1.000000), 'name': 'minTair', 'value': 0.7}, {'interface': IFloat(min=-30, max=45, step=1.000000), 'name': 'maxTair', 'value': 7.2}, {'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'cropHeatFlux', 'value': 447.912}, {'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'conductance', 'value': 598.685}, {'interface': IFloat(min=0, max=10, step=1.000000), 'name': 'lambdaV', 'value': 2.454}, {'interface': IFloat, 'name': 'rhoDensityAir', 'value': 1.225}, {'interface': IFloat, 'name': 'specificHeatCapacityAir', 'value': 0.00101}],
                outputs=[{'interface': IFloat(min=-30, max=45, step=1.000000), 'name': 'minCanopyTemperature'}, {'interface': IFloat(min=-30, max=45, step=1.000000), 'name': 'maxCanopyTemperature'}],
                widgetmodule=None,
                widgetclass=None,
               )




EvapoTranspiration_model_EvapoTranspiration = Factory(name='EvapoTranspiration',
                authors='OpenAlea Consortium (wralea authors)',
                description='According to the availability of wind and/or vapor pressure daily data, the\n            SiriusQuality2 model calculates the evapotranspiration rate using the Penman (if wind\n            and vapor pressure data are available) (Penman 1948) or the Priestly-Taylor\n            (Priestley and Taylor 1972) method ',
                category='Unclassified',
                nodemodule='EvapoTranspiration',
                nodeclass='model_EvapoTranspiration',
                inputs=[{'interface': IInt(min=0, max=1, step=1), 'name': 'isWindVpDefined', 'value': 1}, {'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'evapoTranspirationPriestlyTaylor', 'value': 449.367}, {'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'evapoTranspirationPenman', 'value': 830.958}],
                outputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'evapoTranspiration'}],
                widgetmodule=None,
                widgetclass=None,
               )




SoilEvaporation_model_SoilEvaporation = Factory(name='SoilEvaporation',
                authors='OpenAlea Consortium (wralea authors)',
                description='Starting from a soil at field capacity, soil evaporation  is assumed to\n                be energy limited during the first phase of evaporation and diffusion limited thereafter.\n                Hence, the soil evaporation model considers these two processes taking the minimum between\n                the energy limited evaporation (PtSoil) and the diffused limited\n                evaporation ',
                category='Unclassified',
                nodemodule='SoilEvaporation',
                nodeclass='model_SoilEvaporation',
                inputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'diffusionLimitedEvaporation', 'value': 6605.505}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'energyLimitedEvaporation', 'value': 448.24}],
                outputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'soilEvaporation'}],
                widgetmodule=None,
                widgetclass=None,
               )




Penman_model_Penman = Factory(name='Penman',
                authors='OpenAlea Consortium (wralea authors)',
                description='This method is used when wind and vapor pressure daily data are available\n        ',
                category='Unclassified',
                nodemodule='Penman',
                nodeclass='model_Penman',
                inputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'evapoTranspirationPriestlyTaylor', 'value': 449.367}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'hslope', 'value': 0.584}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'VPDair', 'value': 2.19}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'psychrometricConstant', 'value': 0.66}, {'interface': IFloat(min=0, max=100, step=1.000000), 'name': 'Alpha', 'value': 1.5}, {'interface': IFloat(min=0, max=10, step=1.000000), 'name': 'lambdaV', 'value': 2.454}, {'interface': IFloat, 'name': 'rhoDensityAir', 'value': 1.225}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'specificHeatCapacityAir', 'value': 0.00101}, {'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'conductance', 'value': 598.685}],
                outputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'evapoTranspirationPenman'}],
                widgetmodule=None,
                widgetclass=None,
               )




SoilHeatFlux_model_SoilHeatFlux = Factory(name='SoilHeatFlux',
                authors='OpenAlea Consortium (wralea authors)',
                description='The available energy in the soil ',
                category='Unclassified',
                nodemodule='SoilHeatFlux',
                nodeclass='model_SoilHeatFlux',
                inputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'netRadiationEquivalentEvaporation', 'value': 638.142}, {'interface': IFloat(min=0, max=100, step=1.000000), 'name': 'tau', 'value': 0.9983}, {'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'soilEvaporation', 'value': 448.24}],
                outputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'soilHeatFlux'}],
                widgetmodule=None,
                widgetclass=None,
               )




NetRadiationEquivalentEvaporation_model_NetRadiationEquivalentEvaporation = Factory(name='NetRadiationEquivalentEvaporation',
                authors='OpenAlea Consortium (wralea authors)',
                description=' It is given by dividing net radiation by latent heat of vaporization of water ',
                category='Unclassified',
                nodemodule='NetRadiationEquivalentEvaporation',
                nodeclass='model_NetRadiationEquivalentEvaporation',
                inputs=[{'interface': IFloat(min=0, max=10, step=1.000000), 'name': 'lambdaV', 'value': 2.454}, {'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'netRadiation', 'value': 1.566}],
                outputs=[{'interface': IFloat(min=0, max=5000, step=1.000000), 'name': 'netRadiationEquivalentEvaporation'}],
                widgetmodule=None,
                widgetclass=None,
               )




Conductance_model_Conductance = Factory(name='Conductance',
                authors='OpenAlea Consortium (wralea authors)',
                description='The boundary layer conductance is expressed as the wind speed profile above the\n            canopy and the canopy structure. The approach does not take into account buoyancy\n            effects. \n        ',
                category='Unclassified',
                nodemodule='Conductance',
                nodeclass='model_Conductance',
                inputs=[{'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'vonKarman', 'value': 0.42}, {'interface': IFloat(min=0, max=10, step=1.000000), 'name': 'heightWeatherMeasurements', 'value': 2}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'zm', 'value': 0.13}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'zh', 'value': 0.013}, {'interface': IFloat(min=0, max=1, step=1.000000), 'name': 'd', 'value': 0.67}, {'interface': IFloat(min=0, max=1000, step=1.000000), 'name': 'plantHeight', 'value': 0}, {'interface': IFloat(min=0, max=1000000, step=1.000000), 'name': 'wind', 'value': 124000}],
                outputs=[{'interface': IFloat(min=0, max=10000, step=1.000000), 'name': 'conductance'}],
                widgetmodule=None,
                widgetclass=None,
               )




