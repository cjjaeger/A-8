# This is the server
data("iris")
data <- iris
shinyServer(function(input, output) {
  

  output$scat <- renderPlotly({
    #if statement test if we plot the sepal or petal data
    if(input$measured == "sepal"){
     
       #letting the user choose between a specific species or choose to compare them all
      if(input$species == "all"){
        
        p <- plot_ly(data, 
                     x = Sepal.Width, 
                     y = Sepal.Length, 
                     type = "scatter",
                     mode = "markers", 
                     color = Species)#setting color to differentiate species plotted
      }else{
        
        p <- plot_ly(data[data$Species == input$species,], 
                     x = Sepal.Width, 
                     y = Sepal.Length,
                     type = "scatter", 
                     mode = "markers")
      }
    #the case where petal data is shown  
    }else{
    
      if(input$species == "all"){
        
        p <- plot_ly(data, 
                     x = Petal.Width, 
                     y = Petal.Length,
                     type = "scatter",
                     mode = "markers", 
                     color = Species)
      }else{
        
        p <- plot_ly(data[data$Species == input$species,], 
                     x = Petal.Width, 
                     y = Petal.Length,
                     type = "scatter", 
                     mode = "markers")
      }
    }  
    
  })
  
})