
#listOf Masses
weightList=c(3.3e23,4.9e24,6.0e24,6.4e23,1.9e27,5.7e26,8.7e25,1.0e26,7.5e22,2.0e30,1.3e22)
radiusList=c(2440,6052,6371,3400,71500,60250,25600,24750,1740,700000,1140)
names(weightList)=c("Mercury","Venus","Earth","Mars","Jupiter","Saturn","Uranus","Neptune","The Moon","The Sun","Pluto")
names(radiusList)=names(weightList)


weightOnPlanet<-function(key="Earth",x){
  ans<-x/(weightList["Earth"]/radiusList["Earth"]^2)*weightList[key]/(radiusList[key]^2)

  return (ans)
}

massRadiusSpecificGravity<-function(key){
   return(paste(key,"- Which has a mass of ",weightList[key],"kg, and radius of ",radiusList[key],"km",sep=""))
  
}

planetMass<-function(key="Earth"){}

shinyServer(
  function(input, output) {
    output$planet <- renderPrint({massRadiusSpecificGravity(input$planetChoice)})
    
    output$weight <- renderPrint({unname(weightOnPlanet(input$planetChoice,input$earthWeight))})
  }
)