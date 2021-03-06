get_AIbiom<-function(species=21740){

  test<-paste("SELECT AI.BIOMASS_INPFC.SURVEY,\n ",
    "AI.BIOMASS_INPFC.YEAR,\n ",
    "AI.BIOMASS_INPFC.SUMMARY_AREA,\n ",
    "AI.BIOMASS_INPFC.SPECIES_CODE,\n ",
    "AI.BIOMASS_INPFC.AREA_BIOMASS,\n ",
    "AI.BIOMASS_INPFC.BIOMASS_VAR,\n ",
    "AI.BIOMASS_INPFC.AREA_POP,\n ",
    "AI.BIOMASS_INPFC.POP_VAR\n ",
    "FROM AI.BIOMASS_INPFC\n ",
   "WHERE AI.BIOMASS_INPFC.SUMMARY_AREA != 799\n ",
   "AND AI.BIOMASS_INPFC.SPECIES_CODE    = ",species,"\n",
   "ORDER BY AI.BIOMASS_INPFC.YEAR,\n ",
   "AI.BIOMASS_INPFC.SUMMARY_AREA ",sep="")
  
  Biom=sqlQuery(AFSC,test)
  Biom
  }